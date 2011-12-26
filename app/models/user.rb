class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Avatar attributes -- Managed bu Paperclip
  has_attached_file :avatar, :styles =>  { :big => "120x120>", :medium => "50x50", :thumb => "20x20>" }

  # Setup accessible (or protected) attributes for your model
  attr_accessible :nickname, :email, :password, :password_confirmation, :remember_me, :website, :biography, :score, :avatar

  # Validations
  validates_presence_of :nickname

  # Relations
  has_many :codes
  has_many :authentications
  
  # Callbacks
  before_save :init_score
  after_create :send_welcome_email

  # Scopes
  scope :recent, :order => "created_at desc"
  scope :best, :order => "score desc"

  def apply_omniauth omniauth
    authentications.build(:provider => omniauth['provider'], 
                          :uid => omniauth['uid'], 
                          :nickname => omniauth['user_info']['nickname'], 
                          :name => omniauth['user_info']['name'])
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  private
  def init_score
    puts "Initialize score"
	  self.score ||= 1
  end

  def send_welcome_email
    UserMailer.delay.welcome_email self
  end
end

  