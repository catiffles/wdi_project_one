require 'rails_helper'

RSpec.describe List  do
  describe '.create' do
    it 'creates a new list' do
      expect(List.create()).to be_a List
    end

    it 'is invalid without a name' do
      expect(List.create(name: '')).not_to be_valid
    end

    it 'is valid with a name' do
      expect(List.create(name: 'Sheep go Meep')).to be_valid
    end
  end
end