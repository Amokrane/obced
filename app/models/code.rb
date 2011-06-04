require 'net/http'
require 'net/https'

class Code < ActiveRecord::Base
  # Relations
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments
  belongs_to :code_state
  
  # Callbacks
  before_create :init_score, :initialize_state

  # Named scopes
  scope :best, :order => 'score desc'
  scope :recent, :order => 'created_at desc'
  #scope :popular, :include => :comments, :order => ''

  def tag! tags
    tags = tags.split(" ").map do |tag|
        Tag.find_or_create_by_name(tag) 
    end
    self.tags << tags
  end

  def email_as_selected_to_author
    # Sending an email to the author annoucing the good news
    if self.user.email_selected_code == true
      UserMailer.delay.code_selected_email self.user
    end
  end

  def email_as_selected_to_subscribers
    subscribers = User.all.map.reject { |u| (u == self.user) and (u.email_code_of_the_day != true) }
    subscribers.each do |subscriber|
      UserMailer.delay.code_of_the_day_email(subscriber, self)
    end
  end

  def email_to_external_user user, to_name, to_email
    UserMailer.delay.code_to_external_user_email(user, to_name, to_email, self)
  end

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

  private
  def init_score
    self.score ||= 0
  end

  def initialize_state
    self.code_state = CodeState.find_by_name("Active")
  end

end
