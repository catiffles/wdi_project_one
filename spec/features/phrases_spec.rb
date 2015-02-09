require 'rails_helper'

RSpec.feature 'Managing phrases' do
  scenario 'List all phrases associated with a list' do
    list = List.create!(name: 'Cows')
    phrase = Phrase.create!(english: 'Moo')

    visit "/list/#{list.id}"

    expect(page).to have_content 'Phrase'
  end

  scenario 'Create a phrase' do
    list = List.create!(name: 'Cows')

    visit "/list/#{list.id}"

    fill_in 'phrase', with: 'Moo'
    click_on 'Save'

    expect(page).to have_content('Moo')
  end

  scenario 'Read a phrase' do
    phrase = Phrase.create!(english: 'Cows')

    visit "/phrases/#{phrase.id}"

    expect(page).to have_content 'Cows'
  end

  scenario 'Update a phrase' do
    phrase = Phrase.create!(english: 'Cows')

    visit "/phrases/#{phrase.id}/edit"

    fill_in 'phrase', with: 'Cats'
    click_on 'Save'

    expect(page).to have_content 'Cats'
  end

  scenario 'Delete a phrase' do
    list = List.create!(name: 'Animals')
    phrase = Phrase.create!(english: 'Cows')

    visit "/phrases/#{phrase.id}/edit"
    click_on 'Destroy Phrase'

    expect(page).to have_content(/success/i)
  end
end