require_relative '../rails_helper'

describe 'The books index page' do

  before(:each) do
    visit 'books'
  end

  context '(Aggregate Failures: OFF)' do
    it 'contains the text "Listing Books"' do
      expect(page).to have_content 'Listing Books'
    end

    it 'has a link for creating a new book' do
      expect(page).to have_link 'New Book'
    end

    it 'redirects to a new book form' do
      click_link 'New Book'

      expect(page).to have_content 'Old Book'
      expect(current_url).to have_content '/books/old'
    end

  end

  context '(Aggregate Failures: ON)' do
    it 'contains the text "Listing Books"' do
      expect(page).to have_content 'Listing Books'
    end

    it 'has a link for creating a new book' do
      expect(page).to have_link 'New Book'
    end

    it 'redirects to a new book form (AF block example)' do
      click_link 'New Book'

      aggregate_failures 'redirect is successful' do
        expect(page).to have_content 'Old Book'
        expect(current_url).to have_content '/books/old'
      end
    end

    it 'redirects to a new book form (AF tag example)', :aggregate_failures do
      click_link 'New Book'

      # Note: You can apply the :aggregate_failures tag on any spec,
      # context, or describe blocks, which will affect the scope accordingly.

      expect(page).to have_content 'Old Book'
      expect(current_url).to have_content '/books/old'
    end

  end

  context 'Compound Expectations' do
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

      # It seems rspec wants to do us a favor by avoiding complex boolean logic:
      expect(page.text).to_not start_with('New').and end_with('Back')
      expect(current_url).not_to start_with('http://') & end_with('/books/new')
    end
  end

end