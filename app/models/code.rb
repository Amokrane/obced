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
  scope :recent, :order => 'created_at desc', :limit => 5
  #scope :popular, :include => :comments, :order => ''

  # Validations
  # Vérifier que la description est fournie ainsi que les titres et contenu
  validates_presence_of :title, :description, :content
  
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

  private
  def init_score
    self.score ||= 0
  end

  def initialize_state
    #self.code_state = CodeState.find_by_name("Active")
  end

end
