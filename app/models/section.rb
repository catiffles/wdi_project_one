class Section < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  validates :name, presence: true
  has_many :lists, dependent: :destroy
end
