class Code < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags

  after_initialize :init
  before_create :initialize_state

  def init
  	self.score ||= 0
  end

  def initialize_state
  	self.state = "proposed"
  end

  def tag! tags
    tags = tags.split(" ").map do |tag|
      Tag.find_or_create_by_name(tag)
    end
    self.tags << tags
  end
end
