class Code < ActiveRecord::Base
  # Relations
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments
  belongs_to :code_state
  
  # Callbacks
  before_create :init_score, :initialize_state

  # Named scopes
  named_scope :best, :order => 'score desc'
  named_scope :recent, :order => 'created_at desc'
  #named_scope :popular, :include => :comments, :order => ["score + ?.comments desc", self]

  def tag! tags
    tags = tags.split(" ").map do |tag|
        Tag.find_or_create_by_name(tag) 
    end
    self.tags << tags
  end

  private
  def init_score
    self.score ||= 0
  end

  def initialize_state
    self.code_state = CodeState.find_by_name("Active")
  end

end
