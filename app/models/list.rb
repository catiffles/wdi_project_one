class List < ActiveRecord::Base
  belongs_to :sections
  validates :name, presence: true
  has_many :phrases, dependent: :destroy
end
