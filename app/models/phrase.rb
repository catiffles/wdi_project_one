class Phrase < ActiveRecord::Base
  belongs_to :list
  belongs_to :user
  validates :english, presence: true
end
