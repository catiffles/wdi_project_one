require 'rails_helper'

RSpec.describe Section do
  describe '.create' do
    it 'creates a new section' do
      expect(Section.create()).to be_a Section
    end

    it 'is invalid without a name' do
      expect(Section.create(name: '')).not_to be_valid
    end

    it 'is valid with a name' do
      expect(Section.create(name: 'Sheep go Meep')).to be_valid
    end
  end
end
