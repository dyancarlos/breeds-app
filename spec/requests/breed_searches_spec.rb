require 'rails_helper'

RSpec.describe 'Breed Searches' do
  describe 'GET /show' do
    context 'when valid query param' do
      it 'searches a random image by breed name' do
        stub = stub_request(:get, 'https://dog.ceo/api/breed/retriever/images/random')
               .to_return(status: 200, body: { status: 'success' }.to_json)

        get breed_searches_path,
            params: { breed_search_form: { query: 'retriever' } }

        expect(stub).to have_been_requested
      end

      it 'searches a random image by capitalized breed name' do
        stub = stub_request(:get, 'https://dog.ceo/api/breed/retriever/images/random')
               .to_return(status: 200, body: { status: 'success' }.to_json)

        get breed_searches_path,
            params: { breed_search_form: { query: 'Retriever' } }

        expect(stub).to have_been_requested
      end
    end

    context 'when invalid query params' do
      it 'does not request while blank query' do
        get breed_searches_path,
            params: { breed_search_form: { query: '' }, format: :js }

        expect(WebMock).not_to have_requested(:get, 'https://dog.ceo')
      end
    end
  end
end
