# frozen_string_literal: true

describe ItemsController do
  describe 'GET #index' do
    before do
      create_list(:item, 10)
      get :index
    end

    it 'return http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'return all items' do
      expect(json.size).to eq(10)
    end
  end

  describe 'GET #show' do

    let(:item) { create(:item) }

    subject(:show_request) { get :show, params: { id: item.id } }

    it 'return Http success' do
      show_request
      expect(response).to have_http_status(:ok)
    end

    it 'return item' do
      show_request
      expect(json['name']).to eq(item.name)
    end
  end

  describe 'POST #create' do

    let!(:item) { create(:item) }

    subject(:create_request) { post :create, params: { item: item.attributes } }

    it 'returns http created' do
      create_request
      expect(response).to have_http_status(:created)
    end

    it 'creates a new item' do
      expect { create_request }.to change(Item, :count).by(1)
    end
  end

  describe 'PUT #update' do

    let(:item) { create(:item) }

    subject(:update_request) { put :update, params: { id: item.id, item: {"text": "abc"} } }

    it 'returns Http found' do
      update_request
      expect(response).to have_http_status(:found)
    end

    it 'updates the item' do
      expect { update_request }.to change { item.reload.text }.to("abc")
    end
  end

  describe 'DELETE #destroy' do
    let!(:item) { create(:item) }

    subject(:destroy_request) { delete :destroy, params: { id: item.id } }

    it 'returns Http no content' do
      destroy_request
      expect(response).to have_http_status(:no_content)
    end

    it 'deletes the item' do
      expect { destroy_request }.to change(Item, :count).by(-1)
    end
  end

  describe "DELETE #destroy tag from item" do
    let(:item) { create(:item) }
    let(:tag) { create(:tag) }
    subject(:remove_tag_request) { delete :destroy_tag_from_item, params: { id: item.id, tag_id: tag.id } }

    it 'returns Http found' do
      item.tags << tag
      remove_tag_request
      expect(response).to have_http_status(:found)
    end

    it 'deletes tag from item' do
      item.tags << tag
      expect { remove_tag_request }.to change(item.reload.tags, :count).by(-1)
    end

    it 'tag is not deleted from tags table' do
      item.tags << tag
      expect { remove_tag_request }.to change(Tag, :count).by(0)
    end
  end

end
