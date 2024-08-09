class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    # @list = List.find(params[:id])
    # raise
    # @movies = Movie.all
    # @bookmark = Bookmark.new
  end

  def new
    # @movies = Movie.all
    @list = List.new
  end

  def create
    # @bookmark = Bookmark.new
    @list = List.new(list_params)
    if @list.save
      redirect_to @list
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    # @bookmark = Bookmark.new
  end

  def destroy
    @list = List.find(params[:id])
    # raise
    @list.destroy!
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

end
