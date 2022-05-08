class FavoritesController < ApplicationController
	def create
		book=Book.find(params[:book_id])
		like=current_user.favorites.new(book_id: book.id)
		# like=Favorite.new(book_id: book.id,user_id: current_user.id)
		like.save
		redirect_back(fallback_location: root_path)
	end
	def destroy
		book=Book.find(params[:book_id])
		# favorite=Favorite.find_by(book_id: book,user_id: current_user.id)
		favorite=current_user.favorites.find_by(book_id: book.id)
		favorite.destroy
		redirect_back(fallback_location: root_path)
	end


end
