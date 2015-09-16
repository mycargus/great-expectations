require_relative '../rails_helper'

describe 'books index page' do
  before(:each) do
    visit 'books'
  end

  it 'contains the text "Listing Books"' do
    expect(page).to have_content 'Listing Books'
  end

  it 'has a link for creating a new book' do
    expect(page).to have_link 'New Book'
  end

  context 'when on the index page', :aggregate_failures do
    it 'creates a new book' do
      click_link 'New Book'

      expect(page).to have_content 'New Book fail'
      expect(current_url).to have_content '/books/new/fail'
    end
  end
end