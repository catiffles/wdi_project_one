require 'rails_helper'

RSpec.describe Phrase do
  describe '.create' do
    it 'creates a new phrase' do
      expect(Phrase.create()).to be_a Phrase
    end

    it 'is invalid without an English name' do
      expect(Phrase.create(english: '', pinyin: 'stuff')).not_to be_valid
    end

    it 'is valid with an English name' do
      expect(Phrase.create(english: 'minions')).to be_valid
    end
  end
end


