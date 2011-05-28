class Code < ActiveRecord::Base
  # Relations
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments
  belongs_to :code_state
  
  # Callbacks
  after_initialize :init_score, :initialize_state


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
    self.state = "active"
  end

end
