class BooksController < ApplicationController
  def index
  	@books = Book.all
  	@book = Book.new
    @user = current_user
  end

  def create
    @user = current_user
  	@book = Book.new(book_params)

    user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
       redirect_to books_path
    else
         @books = Book.all
         render 'index'
    end
  end

  def show
    @book = Book.find_by(id: params[:id])
    # 変数@userを定義してください
     @user = current_user
     user_id = current_user.id

  end

  def edit
  	@book = Book.find_by(id: params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to books_path
  end

  def destroy
  	 book = Book.find(params[:id])
         book.destroy
        redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end
end
