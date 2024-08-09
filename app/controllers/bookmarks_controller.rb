class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    # @movies = Movie.all
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list


    if @bookmark.save
      redirect_to list_path(@list)
    else
      # raise
      render :new, status: :unprocessable_entity
    end
    # @list = List.find(params[:list_id])
    # @bookmark = Bookmark.new
  end

  def destroy
    # raise
    @bookmark = Bookmark.find(params[:list_id])
    @bookmark.destroy
    redirect_to list_path(List.find(@bookmark.list_id))
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
