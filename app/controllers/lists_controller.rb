class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]
  def index
    @lists = List.all
  end

  def show
    @bookmarks = @list.bookmarks
  end

  def new
    @list = List.new
  end

  def create
    # raise
    @list = List.new(list_params)
    @list.save
    if @list.save == true
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @list.update(list_params)
    redirect_to lists_path
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    if params[:list][:picture_url].empty?
      params.require(:list).permit(:name, :photo)
    else
      params.require(:list).permit(:name, :picture_url)
    end
  end
end
