require 'rails_helper'

RSpec.describe ListsController do
  let(:valid_attributes) {
    { name: 'Cows go moo' }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  describe 'GET edit' do
    it 'has a 200 status code' do
      section = Section.create!(name: 'Animals')
      list = List.create!(name: 'Cows', section_id: section)
      get :edit, section_id: section, id: list
      expect(response.status).to eq 200
    end

    it 'renders the edit template' do
      section = Section.create!(name: 'Animals')
      list = List.create!(name: 'Cows', section_id: section)
      get :edit, section_id: section, id: list
      expect(response).to render_template('edit')
    end

    it 'assigns @list' do
      section = Section.create!(name: 'Animals')
      list = List.create!(name: 'Cows', section_id: section)
      get :edit, section_id: section, id: list
      expect(assigns(:list)).to eq list
    end
  end

  describe 'PATCH update' do
    context 'with valid attributes' do
      let(:new_attributes) {
        { name: 'Cats go meow' }
      }

      it 'updates the requested list' do
        section = Section.create!(name: 'Animals')
        list = List.create!(name: 'Cows', section_id: section)
        patch :update, section_id: section, id: list, list: new_attributes
        list.reload
        expect(list.name).to eq new_attributes[:name]
      end

      it 'assigns @list' do
        section = Section.create!(name: 'Animals')
        list = List.create!(name: 'Cows', section_id: section)
        patch :update, section_id: section, id: list, list: new_attributes
        expect(assigns(:list)).to eq list
      end
    end

    context 'with invalid attributes' do
      it 'assigns @section' do
        section = Section.create!(name: 'Animals')
        list = List.create!(name: 'Cows', section_id: section)
        patch :update, section_id: section, id: list, list: invalid_attributes
        expect(assigns(:list)).to eq list
      end

      it 're-renders the edit template' do
        section = Section.create!(name: 'Animals')
        list = List.create!(name: 'Cows', section_id: section)
        patch :update, section_id: section, id: list, list: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested list' do
      section = Section.create!(name: 'Animals')
      list = List.create!(name: 'Cows', section_id: section)
      expect {
        delete :destroy, id: list
      }.to change(List, :count).by(-1)
    end
  end
end
