require 'rails_helper'

RSpec.feature 'Managing sections' do
  scenario 'List all sections associated with a topic' do
    topic = Topic.create!(name: 'Animals')
    section = Section.create!(name: 'Cows')

    visit "/topics/#{topic.id}"

    expect(page).to have_content 'Sections'
  end
end