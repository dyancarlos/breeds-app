require 'rails_helper'

RSpec.describe 'Breeds Search', type: :system do
  context 'when valid query' do
    it 'shows image' do
      stub_request(:get, 'https://dog.ceo/api/breed/retriever/images/random')
        .to_return(status: 200, body: { status: 'success', message: 'https://images.dog.ceo/breeds/hound-basset/n02088238_6161.jpg' }.to_json)

      visit '/'
      fill_in 'breed_search_form_query', with: 'retriever'
      click_on 'Search'
      within('#result') do
        expect(page).to have_text 'retriever'
        expect(find('.card-img-top')[:src]).to eq('https://images.dog.ceo/breeds/hound-basset/n02088238_6161.jpg')
      end
    end
  end

  context 'when invalid query' do
    it 'shows empty query message' do
      visit '/'
      fill_in 'breed_search_form_query', with: ''
      click_on 'Search'
      expect(page).to have_text "Query can't be blank"
    end

    it 'shows invalid breed name message' do
      stub_request(:get, 'https://dog.ceo/api/breed/invalid/images/random')
        .to_return(status: 200, body: { status: 'error', message: 'Breed not found (master breed does not exist)' }.to_json)

      visit '/'
      fill_in 'breed_search_form_query', with: 'invalid'
      click_on 'Search'
      expect(page).to have_text 'Breed not found (master breed does not exist)'
    end
  end
end
