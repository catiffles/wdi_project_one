class Topic < ActiveRecord::Base
  validates :name, presence: true
  has_many :sections, dependent: :destroy
  belongs_to :user
end
