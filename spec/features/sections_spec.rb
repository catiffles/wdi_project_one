require 'rails_helper'

RSpec.feature 'Managing sections' do
  scenario 'List all sections associated with a topic' do
    topic = Topic.create!(name: 'Animals')
    section = Section.create!(name: 'Cows')

    visit "/topics/#{topic.id}"

    expect(page).to have_content 'Section'
  end

  scenario 'Create a section' do
    topic = Topic.create!(name: 'Animals')
    visit "/topics/#{topic.id}"

    fill_in 'section_name', with: "Cows"
    click_on 'Save'

    expect(page).to have_content("Cows")
  end

  scenario 'Read a section' do
    section = Section.create!(name: 'Cows')

    visit "/sections/#{section.id}"

    expect(page).to have_content 'Cows'
  end

  scenario 'Update a section' do
    section = Section.create!(name: 'Cows')

    visit "/sections/#{section.id}/edit"

    fill_in 'section_name', with: 'Cats'
    click_on 'Save'

    expect(page).to have_content 'Cats'
  end

  scenario 'Delete a section' do
    topic = Topic.create!(name: 'Animals')
    section = Section.create!(name: 'Cows')

    visit "/sections/#{section.id}/edit"

    click_on 'Destroy Section'

    expect(page).to have_content(/success/i)
  end
end