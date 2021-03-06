class UsersController < ApplicationController

def index
	@users = User.all
	@book = Book.find_by(params[:id])
	@user = User.find_by(params[:id])
end

def show
    @user = User.find(params[:id])
    @book = Book.find_by(params[:id])
    @books = Book.all
end
def edit
	@user = User.find(params[:id])
end
def update
	@user = User.find(params[:id])
	@user.update(user_params)
	redirect_to user_path(@user.id)
end

private
  def user_params
	params.require(:user).permit(:name, :profile_image, :introduction)
  end
   def book_params
      params.require(:book).permit(:title, :body)
    end
end