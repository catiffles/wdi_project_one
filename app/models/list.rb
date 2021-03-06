class List < ActiveRecord::Base
  belongs_to :section
  validates :name, presence: true
  has_many :phrases, dependent: :destroy
  belongs_to :user
end
