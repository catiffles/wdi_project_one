require 'rails_helper'

RSpec.feature 'Managing lists' do
  scenario 'List all lists associated with a section' do
    section = Section.create!(name: 'Cows')
    list = List.create!(name: 'Moo')

    visit "/sections/#{section.id}"

    expect(page).to have_content 'List'
  end

  scenario 'Create a list' do
    section = Section.create!(name: 'Cows')

    visit "/sections/#{section.id}"

    fill_in 'list_name', with: 'Moo'
    click_on 'Save'

    expect(page).to have_content('Moo')
  end

  scenario 'Read a list' do
    list = List.create!(name: 'Cows')

    visit "/lists/#{list.id}"

    expect(page).to have_content 'Cows'
  end

  scenario 'Update a list' do
    list = List.create!(name: 'Cows')

    visit "/lists/#{list.id}/edit"

    fill_in 'list_name', with: 'Cats'
    click_on 'Save'

    expect(page).to have_content 'Cats'
  end

  scenario 'Delete a section' do
    section = Section.create!(name: 'Animals')
    list = List.create!(name: 'Cats')

    visit "/lists/#{list.id}/edit"
    click_on 'Destroy List'

    expect(page).to have_content(/success/i)
  end
end