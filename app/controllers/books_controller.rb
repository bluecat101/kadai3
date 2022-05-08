class BooksController < ApplicationController
  before_action :move_to_login
  def index
    @books=Book.all
    @book_error={}
  end

  def create
    @book_new=Book.new(book_params)
    @book_new.user_id=current_user.id
    if @book_new.save
      flash[:alert]="you have created book successfully"
      redirect_to book_path(@book_new.id)
    else
      @books=Book.all
      render "books/index"
    end
  end

  def show
    @book=Book.find(params[:id])
    @comment=BookComment.new
    @book_comments=@book.book_comments
  end

  def edit
    @book=Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:alert]="you have update book successfully"
      redirect_to book_path(@book.id)
    else
      render "books/edit"
    end
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
