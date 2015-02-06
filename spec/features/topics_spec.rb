require 'rails_helper'

RSpec.feature 'Managing topics' do
  scenario 'List all topics' do
    Topic.create!(name: 'Cows')
    Topic.create!(name: 'Cats')
    Topic.create!(name: 'Hippos')

    visit '/topics'

    expect(page).to have_content 'Topics'
  end

  scenario 'Create a topic' do
    visit '/topics/new'

    fill_in 'Name', with: 'Cows'
    click_on 'Create Topic'

    expect(page).to have_content('Cows')
  end

  scenario 'Read a topic' do
    topic = Topic.create!(name: 'Cows')

    visit "/topics/#{topic.id}"

    expect(page).to have_content 'Cows'
  end

  scenario 'Update a topic' do
    topic = Topic.create!(name: 'Cows')

    visit "topics/#{topic.id}/edit"

    fill_in 'Name', with: 'Cats'
    click_on 'Update Topic'

    expect(page).to have_content('Cats')
  end

  scenario 'Delete a topic' do
    topic = Topic.create!(name: 'Cows')

    visit "topics"
    click_on 'Destroy'

  end
end