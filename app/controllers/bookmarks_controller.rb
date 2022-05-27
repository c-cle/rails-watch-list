class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
  end


  # there is a problem here

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])

    @bookmark.list = @list
    @bookmark.movie = @movie

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to list_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
