class Gist < Code
	def self.import_gist_by_user user
    gists = {}
    gists_contents = {}
    i = 0
    
    github_accounts = user.authentications.where("provider = 'github'")
    github_accounts.each do |ga|
      url = URI.parse("http://gist.github.com/api/v1/json/gists/#{ga.nickname}")
      gists_json = Net::HTTP.start(url.host, url.port) do |http|
        http.get("/api/v1/json/gists/#{ga.nickname}")
      end
      gists[i] = JSON.parse(gists_json.body)
      i += 1
    end

    gists.each_pair do |k, v|
      gists[k]["gists"].each do |gist|
        gist["files"].each do |gist_file|
          gists_contents[gist["repo"]] = {}
          response = CurbFu.get("https://gist.github.com/raw/#{gist["repo"]}/#{gist_file}")
          gists_contents[gist["repo"]][gist_file] = response.body
        end
      end
    end 

    return [gists, gists_contents]
  end

  def self.import_gist_by_id gist_id
    url = URI.parse("http://gist.github.com/api/v1/json/#{gist_id}")
    gist_json = Net::HTTP.start(url.host, url.port) do |http|
      http.get("/api/v1/json/#{gist_id}")
    end
    gist = JSON.parse(gist_json.body)

    return gist
  end

  def self.import_gist_content gist_id, gist_file
  end
end