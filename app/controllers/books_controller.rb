class BooksController < ApplicationController

before_action :set_book, only: [ :show, :edit, :update, :destroy ]

  def index
	@available_at = Time.now
	@books = Book.all
  end

  def show
    #@book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render :new
    end
end

#Replaced code class 10 lab 2
#def create
#  @book = Book.new(book_params)
#  @book.save
#  redirect_to @book
#end

def create
    @book = Book.new(book_params)
    if @book.save
      #replaced redirect in class 10 lab 2
      #redirect_to @book
      redirect_to @book, notice: "#{@book.title} was created!"
    else
      render :new
    end
end


def edit
  #@book = Book.find(params[:id])
end

# Replaced code on class 10, lab2
#def update
#  #@book = Book.find(params[:id])
#  @book.update(book_params)
#  redirect_to @book
#end

def update
    if @book.update(book_params)
      #Replaced redirect in class 10 lab 3
      #redirect_to @book
      redirect_to @book, notice: "#{@book.title} was created!"
    else
      render :new
    end
end


def destroy
  #@book = Book.find(params[:id])
  @book.destroy
  redirect_to books_url
end

private

def book_params
  params.require(:book).permit(:title, :author, :pages, :price)
end

def set_book
  @book = Book.find(params[:id])
end

end
