class BooksController < ApplicationController
  layout 'home'

  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    @books = retrieve.order(:id).page(params[:page]).per(10)
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    if params[:author]
      @author = Author.find_by(id: params[:author])
    end
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params.except(:classes))
        @book.classes = book_params[:classes].split(",").collect(&:lstrip)
        @book.save!
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:content_name, :isbn, :original_title, :year, :language_code, :category, :images, :category, :plot, :copyright, :title, :average_rating, :rating_count, :similar_books, :description, :loc_class, :pages, :language, :isbn13, :release_date, :cover, :cover_art, :summary, :content_cleaned, :classes, :content_available, :author, author_ids: [], wikipedia: [:url, :found, :year], gutenberg: [:url, :num], goodreads: [:url, :found, :year])
    end
    
    def retrieve
      books = Book.all
      books = books.having_authors(params[:authors])if params[:authors].present?
      books = books.where('CAST(year AS TEXT) = ANY(ARRAY[?])', params[:years]) if params[:years].present?
      books = books.where('pages >= ?', params[:pages_min]) if params[:pages_min].present?
      books = books.where('pages <= ?', params[:pages_max]) if params[:pages_max].present?

      books
    end
    
end
