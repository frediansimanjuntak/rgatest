require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "Books"
  end

  test "should create book" do
    visit books_url
    click_on "New book"

    fill_in "Average rating", with: @book.average_rating
    fill_in "Category", with: @book.category
    fill_in "Classes", with: @book.classes
    check "Content available" if @book.content_available
    check "Content cleaned" if @book.content_cleaned
    fill_in "Content name", with: @book.content_name
    fill_in "Copyright", with: @book.copyright
    fill_in "Cover", with: @book.cover
    fill_in "Description", with: @book.description
    fill_in "Goodreads", with: @book.goodreads
    fill_in "Gutenberg", with: @book.gutenberg
    fill_in "Images", with: @book.images
    fill_in "Isbn", with: @book.isbn
    fill_in "Isbn13", with: @book.isbn13
    fill_in "Language", with: @book.language
    fill_in "Language code", with: @book.language_code
    fill_in "Loc class", with: @book.loc_class
    fill_in "Original title", with: @book.original_title
    fill_in "Pages", with: @book.pages
    fill_in "Plot", with: @book.plot
    fill_in "Rating count", with: @book.rating_count
    fill_in "Release date", with: @book.release_date
    fill_in "Similar books", with: @book.similar_books
    fill_in "Summary", with: @book.summary
    fill_in "Title", with: @book.title
    fill_in "Wikipedia", with: @book.wikipedia
    fill_in "Year", with: @book.year
    click_on "Create Book"

    assert_text "Book was successfully created"
    click_on "Back"
  end

  test "should update Book" do
    visit book_url(@book)
    click_on "Edit this book", match: :first

    fill_in "Average rating", with: @book.average_rating
    fill_in "Category", with: @book.category
    fill_in "Classes", with: @book.classes
    check "Content available" if @book.content_available
    check "Content cleaned" if @book.content_cleaned
    fill_in "Content name", with: @book.content_name
    fill_in "Copyright", with: @book.copyright
    fill_in "Cover", with: @book.cover
    fill_in "Description", with: @book.description
    fill_in "Goodreads", with: @book.goodreads
    fill_in "Gutenberg", with: @book.gutenberg
    fill_in "Images", with: @book.images
    fill_in "Isbn", with: @book.isbn
    fill_in "Isbn13", with: @book.isbn13
    fill_in "Language", with: @book.language
    fill_in "Language code", with: @book.language_code
    fill_in "Loc class", with: @book.loc_class
    fill_in "Original title", with: @book.original_title
    fill_in "Pages", with: @book.pages
    fill_in "Plot", with: @book.plot
    fill_in "Rating count", with: @book.rating_count
    fill_in "Release date", with: @book.release_date
    fill_in "Similar books", with: @book.similar_books
    fill_in "Summary", with: @book.summary
    fill_in "Title", with: @book.title
    fill_in "Wikipedia", with: @book.wikipedia
    fill_in "Year", with: @book.year
    click_on "Update Book"

    assert_text "Book was successfully updated"
    click_on "Back"
  end

  test "should destroy Book" do
    visit book_url(@book)
    click_on "Destroy this book", match: :first

    assert_text "Book was successfully destroyed"
  end
end
