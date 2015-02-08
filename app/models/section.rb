class Section < ActiveRecord::Base
  belongs_to :topic
  validates :name, presence: true
  has_many :lists
end
