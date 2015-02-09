require 'rails_helper'

RSpec.describe SectionsController do
  let(:valid_attributes) {
    { name: 'Cows go moo' }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  describe 'GET edit' do
    it 'has a 200 status code' do
      topic = Topic.create!(name: 'Animals')
      section = Section.create!(name: 'Cows', topic_id: topic)
      get :edit, topic_id: topic, id: section
      expect(response.status).to eq 200
    end

    it 'renders the edit template' do
      topic = Topic.create!(name: 'Animals')
      section = Section.create!(name: 'Cows', topic_id: topic)
      get :edit, topic_id: topic, id: section
      expect(response).to render_template('edit')
    end

    it 'assigns @section' do
      topic = Topic.create!(name: 'Animals')
      section = Section.create!(name: 'Cows', topic_id: topic)
      get :edit, topic_id: topic, id: section
      expect(assigns(:section)).to eq section
    end
  end

  describe 'PATCH update' do
    context 'with valid attributes' do
      let(:new_attributes) {
        { name: 'Cats go meow' }
      }

      it 'updates the requested sectioin' do
        topic = Topic.create!(name: 'Animals')
        section = Section.create!(name: 'Cows', topic_id: topic)
        patch :update, topic_id: topic, id: section, section: new_attributes
        section.reload
        expect(section.name).to eq new_attributes[:name]
      end

      it 'assigns @section' do
        topic = Topic.create!(name: 'Animals')
        section = Section.create!(name: 'Cows', topic_id: topic)
        patch :update, topic_id: topic, id: section, section: new_attributes
        expect(assigns(:section)).to eq section
      end
    end

    context 'with invalid attributes' do
      it 'assigns @comment' do
        topic = Topic.create!(name: 'Animals')
        section = Section.create!(name: 'Cows', topic_id: topic)
        patch :update, topic_id: topic, id: section, section: invalid_attributes
        expect(assigns(:section)).to eq section
      end

      it 're-renders the edit template' do
        topic = Topic.create!(name: 'Animals')
        section = Section.create!(name: 'Cows', topic_id: topic)
        patch :update, topic_id: topic, id: section, section: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested section' do
      topic = Topic.create!(name: 'Animals')
      section = Section.create!(name: 'Cows', topic_id: topic)
      expect {
        delete :destroy, id: section
      }.to change(Section, :count).by(-1)
    end
  end
end