class BooksController < ApplicationController
  def new
    @book = Book.new
    # by convention renders "/app/views/books/new.html.erb"
  end

  def create
    # This works fine, but if you have a lot of fields in the form, it will be tedious to list them out individually
    # book = Book.new(
    #   title: params[:title],
    #   author: params[:author]
    # )

    # @book = Book.new(params.require(:book).permit(:title, :author))
    # The line above is roughly the same as the line below
    @book = Book.new(params[:book].permit(:title, :author))
    if @book.save
      # flash[:notice] = "Successfully created book <strong>#{params[:book][:title]}</strong>"
      # keys: notice, error, warning, alert
      redirect_to books_path
      # When we do a redirect the following steps happen
      # 1. server sends: 301 ->  "please make a GET request to /books"
      # 2. browser: GET "/books"
      # 3. server sends html for /books
      
      # short version of the redirect_to
      redirect_to books_path, notice: "Successfully created book <strong>#{params[:book][:title]}</strong>"
      redirect_to books_path, flash: {error: "Some error"}
    else
      flash.now[:error] = "There was an error in the form"
      render :new
      # 1. send back html for the form
    end
  end

  def index
    if params[:query]
      @books = Book.where("title LIKE ?", "%#{params[:query]}%")
    else
      @books = Book.all
    end
  end

  # /books/:id/edit
  def edit
    @book = Book.find(params[:id])
    render :edit
  end

  # The line
  #  book = Book.new(params[:book].permit(:title, :author))
  # can be refactored to
  #  book = Book.new(book_params)
  private
  def book_params
    params[:book].permit(:title, :author)
  end

end
