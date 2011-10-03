["Active", "Selected", "Archived", "Inactive"].each do |cs|
	CodeState.find_or_create_by_name(cs)
end

seed_users_hash = [{"email" => "amokrane.chentir@gmail.com", "password" => "password", 
					"nickname" => "Amokrane", "website " => "http://www.chentir.com", 
					"biography" => "Programmer"},{"email" => "me@ghislaineguerin.com", "password" => "password", 
					"nickname" => "Ghislaine", "website " => "http://www.ghislaineguerin.com", 
					"biography" => "Designer"}]

seed_users_hash.each do |attributes|
  	User.create!(
  		attributes.merge!(
  			:password_confirmation => attributes[:password]
  		)
  	)
end

seed_codes_hash = [{"title" => "HelloWorld_C", "language" => "C", "content" => "```ruby\r\nputs \"Hello World!\"\r\n```", 
	"description" => "Hello World In C", "user_id" => User.find_by_email("me@ghislaineguerin.com").id},  
 {"title" => "HelloWorld_Ruby", "language" => "Ruby", "content" => "```ruby\r\nputs \"Hello World!\"\r\n```", 
	 "description" => "Hello World In Ruby", "user_id" => User.find_by_email("amokrane.chentir@gmail.com").id},  
 {"title" => "HelloWorld_JavaScript", "language" => "JavaScript", "content" => "```ruby\r\nputs \"Hello World!\"\r\n```", 
	 "description" => "Hello World in JavaScript", "user_id" => User.find_by_email("amokrane.chentir@gmail.com").id}]


seed_codes_hash.each do |attributes|
  	Code.create!(attributes)
end
