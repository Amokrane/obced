class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :nickname, :email, :password, :password_confirmation, :remember_me, :website, :biography, :score

  # Validations
  validates_presence_of :nickname

  # Relations
  has_many :codes
  has_many :authentications
  
  # Callbacks
  after_initialize :init_score
  before_save :init_nickname
  after_create :send_welcome_email

  # Scopes
  scope :recent, :order => "created_at desc"
  scope :best, :order => "score desc"

  def apply_omniauth omniauth
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  private
  def init_score
  	score ||= 0
  end

  def init_nickname
    m = /^(.+)\@/.match self.email
    nickname ||= m[1]
  end

  def send_welcome_email
    UserMailer.delay.welcome_email self
  end
end

  