class Phrase < ActiveRecord::Base
  belongs_to :list
  validates :english, presence: true
end
