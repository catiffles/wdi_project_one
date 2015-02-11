require 'rails_helper'

RSpec.describe PhrasesController do
  let(:valid_attributes) {
    { english: 'Cows', traditional: 'go', pinyin: 'moo' }
  }

  let(:invalid_attributes) {
    { english: nil, traditional: 'go', pinyin: 'moo' }
  }

  describe 'GET edit' do
    it 'has a 200 status code' do
      list = List.create!(name: 'Cows')
      phrase = Phrase.create!(english: 'Cows', traditional: 'go', pinyin: 'moo')
      get :edit, list_id: list, id: phrase
      expect(response.status).to eq 200
    end

    it 'renders the edit template' do
      list = List.create!(name: 'Cows')
      phrase = Phrase.create!(english: 'Cows', traditional: 'go', pinyin: 'moo')
      get :edit, list_id: list, id: phrase
      expect(response).to render_template('edit')
    end

    it 'assigns @phrase' do
      list = List.create!(name: 'Cows')
      phrase = Phrase.create!(english: 'Cows', traditional: 'go', pinyin: 'moo')
      get :edit, list_id: list, id: phrase
      expect(assigns(:phrase)).to eq phrase
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested phrase' do
      list = List.create!(name: 'Cows')
      phrase = Phrase.create!(english: 'Cows', traditional: 'go', pinyin: 'moo')
      expect {
        delete :destroy, id: phrase
      }.to change(Phrase, :count).by(-1)
    end
  end
end
