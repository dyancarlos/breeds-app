require 'rails_helper'

RSpec.describe 'Breed Searches' do
  describe 'GET /index' do
    nil
  end

  describe 'GET /show' do
    context 'when valid query param' do
      it 'searches a random image by breed name' do
        get breed_searches_path,
            params: { breed_search_form: { query: 'retriever' } }
      end
    end

    context 'when invalid query params' do
      it 'aaa' do
        get breed_searches_path,
            params: { breed_search_form: { query: 'invalid' } }
      end
    end
  end
end
