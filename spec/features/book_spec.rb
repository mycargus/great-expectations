require_relative '../rails_helper'

describe 'The books index page' do

  context 'Aggregate Failures' do
    before(:each) do
      visit 'books'
    end

    it 'contains the text "Listing Books"' do
      expect(page).to have_content 'Listing Books'
    end

    it 'has a link for creating a new book' do
      expect(page).to have_link 'New Book'
    end

    it 'redirects to a new book form' do
      click_link 'New Book'

      expect(page).to have_content 'New Book'
      expect(current_url).to have_content '/books/new'
    end

    it 'displays book titles and categories' do

    end
  end

  context 'Compound Expectations' do
    before(:each) do
      visit 'books'
    end

    it 'contains the text "Listing Books"' do
      expect(page).to have_content('Listing Books').or have_content('cheese')
    end

    it 'has a link for creating a new book' do
      expect(page).to have_link('New Book').and have_content('Listing Books')
    end

    it 'redirects to a new book form' do
      click_link 'New Book'

      # AND examples
      expect(page.text).to start_with('New').and end_with('Back')
      expect(current_url).to start_with('http://') & end_with('/books/new')

      # OR examples
      expect(page.text).to start_with('New').or start_with('cheese')
      expect(current_url).to start_with('http://') | end_with('/books/new')
    end
  end

end