module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the signup\s?page/
        '/users/sign_up'
    when /the signin\s?page/
        '/users/sign_in'

    when /the user\s?page for "([^"]*)"/
        user_path(User.find_by_nickname!($1))
    when /the user\s?page/
        '/users'
    when /the home\s?page/
      '/'
      
    when /the codes\s?page/
      '/codes'

    

    when /the code\s?page for "([^"]*)"/ 
      code_path(Code.find_by_title!($1))

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
