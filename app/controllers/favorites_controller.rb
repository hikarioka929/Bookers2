class FavoritesController < ApplicationController

  def create
    @book = Book.find(params[:book_id]) #@bookのインスタンス変数で回されてる最中だから@bookがなんなのか指定が必要？
    favorite = current_user.favorites.new(book_id: @book.id) #current_userに関連したFavoriteクラスの新しいインスタンスが作成される
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @book = Book.find(params[:book_id]) #books_controllerじゃないからidはbook_idにする
    favorite = current_user.favorites.find_by(book_id: @book.id) #current_userに関連したFavoriteを探し出している
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
