class BooksController < ApplicationController
  
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "Book was successfully created."
    else
      @books = Book.all
      render :index 
    end
    
    # book = Book.new(book_params)
    # @book.save
    # redirect_to book_path(@book.id) 
    
  end
  
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
   
  end
  
  def update
    @book = Book.find(params[:id])
    
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:notice] = "Book was successfully created."
    else
      render :edit
    end
  end  
  
  def destroy
     book = Book.find(params[:id])
     if book.destroy
       redirect_to '/books'
       flash[:notice] = "Book was successfully destroyed."
      else
    #   @books = Book.all
       render :index 
      end
  end

  private  
  
  def book_params
    params.require(:book).permit(:title, :body)
  end

end

