require 'rails_helper'

RSpec.describe 'ShoppingLists API', type: :request do
  let!(:shoppinglists) { create_list(:shoppinglist, 10) }
  let(:shoppinglist_id) { shoppinglists.first.id }

  # Test suite for GET /shoppinglists
  describe 'GET /shoppinglists' do
    before { get '/shoppinglists' }

    it 'returns shoppinglists' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /shoppinglists/:id
  describe 'GET /shoppinglists/:id' do
    before { get "/shoppinglists/#{shoppinglist_id}" }

    context 'when the record exists' do
      it 'returns the shoppinglist' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(shoppinglist_id)
      end
  
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:shoppinglist_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Shoppinglist/)
      end
    end
  end

  # Test suite for POST /shoppinglists
  describe 'POST /shoppinglists' do
    let(:valid_attributes) { { title: 'A shopping list title' } }

    context 'when the request is valid' do
      before { post '/shoppinglists', params: valid_attributes }

      it 'creates a shoppinglist' do
        expect(json['title']).to eq('A shopping list title')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/shoppinglists', params: {  } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  # Test suite for PUT /shoppinglists/:id
  describe 'PUT /shoppinglists/:id' do
    let(:valid_attributes) { { title: 'A shopping list again' } }

    context 'when the record exists' do
      before { put "/shoppinglists/#{shoppinglist_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /shoppinglists/:id
  describe 'DELETE /shoppinglists/:id' do
    before { delete "/shoppinglists/#{shoppinglist_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end