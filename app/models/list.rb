class List < ActiveRecord::Base
  belongs_to :sections
  validates :name, presence: true
end
