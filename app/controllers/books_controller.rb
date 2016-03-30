class BooksController < ApplicationController
  def new
    @book = Book.new
    # by convention renders "/app/views/books/new.html.erb"
  end

  def create
    # @book = Book.new(
    #   title: params[:book][:title],
    #   author: params[:book][:author]
    # )
    # Mass assignment won't work.
    # @book = Book.new(params[:book])
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: "Create book #{@book.title}"
    else
      flash.now[:error] = "Could not create book"
      # redirect_to new_book_path  # Server: 301 - ask browser to requrest /books/new
      #                            # Browser: GET /books/new

      render :new  # Server: "<html><head>...<body><form>"
    end
  end

  def index
    if params[:query]
      @books = Book.where("title LIKE ?", "%#{params[:query]}%")
    else
      @books = Book.all
    end
  end

  private
  # Whitelist the params we want to receive from the new book form
  def book_params
    params.require(:book).permit([:title, :author])
  end

end
