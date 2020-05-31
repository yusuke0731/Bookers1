class BooksController < ApplicationController

def top
	
end
def show
	@book = Book.find(params[:id])

end

def new
	@book = Book.new
end

def create
	@book = Book.new(books_params)
	@books = Book.all
	if @book.save
		flash[:notice] = "successfully"
	redirect_to book_path(@book)
	else
	render :index
	end
end

def edit
	@book = Book.find(params[:id])
    
end

def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
       flash[:notice] = "successfully"
	redirect_to book_path(@book)
    else
    	render :edit
    end
end


def destroy
	book = Book.find(params[:id])
	book.destroy
	redirect_to books_path
end

def index
	@books = Book.all
	@book = Book.new
end

private
def books_params
	params.require(:book).permit(:title, :body)
end
end