require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post books_url, params: { book: { average_rating: @book.average_rating, category: @book.category, classes: @book.classes, content_available: @book.content_available, content_cleaned: @book.content_cleaned, content_name: @book.content_name, copyright: @book.copyright, cover: @book.cover, description: @book.description, goodreads: @book.goodreads, gutenberg: @book.gutenberg, images: @book.images, isbn: @book.isbn, isbn13: @book.isbn13, language: @book.language, language_code: @book.language_code, loc_class: @book.loc_class, original_title: @book.original_title, pages: @book.pages, plot: @book.plot, rating_count: @book.rating_count, release_date: @book.release_date, similar_books: @book.similar_books, summary: @book.summary, title: @book.title, wikipedia: @book.wikipedia, year: @book.year } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { average_rating: @book.average_rating, category: @book.category, classes: @book.classes, content_available: @book.content_available, content_cleaned: @book.content_cleaned, content_name: @book.content_name, copyright: @book.copyright, cover: @book.cover, description: @book.description, goodreads: @book.goodreads, gutenberg: @book.gutenberg, images: @book.images, isbn: @book.isbn, isbn13: @book.isbn13, language: @book.language, language_code: @book.language_code, loc_class: @book.loc_class, original_title: @book.original_title, pages: @book.pages, plot: @book.plot, rating_count: @book.rating_count, release_date: @book.release_date, similar_books: @book.similar_books, summary: @book.summary, title: @book.title, wikipedia: @book.wikipedia, year: @book.year } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
