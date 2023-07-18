# frozen_string_literal: true

describe TagsController do
  describe 'GET #index' do
    before do
      create_list(:tag, 10)
      get :index
    end

    it 'return http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'return all tags' do
      expect(json.size).to eq(10)
    end
  end

  describe 'GET #show' do
    subject(:show_request) { get :show, params: { id: tag.id } }

    let(:tag) { create(:tag) }

    it 'return Http success' do
      show_request
      expect(response).to have_http_status(:ok)
    end

    it 'return tag' do
      show_request
      expect(json['name']).to eq(tag.name)
    end
  end

  describe 'POST #create' do
    subject(:create_request) { post :create, params: { tag: tag.attributes } }

    let(:tag) { build(:tag) }

    it 'returns http created' do
      create_request
      expect(response).to have_http_status(:created)
    end

    it 'creates a new tag' do
      expect { create_request }.to change(Tag, :count).by(1)
    end
  end

  describe 'PUT #update' do
    subject(:update_request) { put :update, params: { id: tag.id, tag: new_attributes } }

    let(:tag) { create(:tag) }
    let(:new_attributes) { attributes_for(:tag) }

    it 'returns Http found' do
      update_request
      expect(response).to have_http_status(:found)
    end

    it 'updates the tag' do
      expect { update_request }.to change { tag.reload.name }.to(new_attributes[:name])
    end
  end

  describe 'DELETE #destroy' do
    subject(:destroy_request) { delete :destroy, params: { id: tag.id } }

    let!(:tag) { create(:tag) }

    it 'returns Http no content' do
      destroy_request
      expect(response).to have_http_status(:no_content)
    end

    it 'deletes the tag' do
      expect { destroy_request }.to change(Tag, :count).by(-1)
    end
  end
end
