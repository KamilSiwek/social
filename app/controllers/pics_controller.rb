class PicsController < ApplicationController
  before_action :pic_find, only: [:show, :edit, :update, :destroy]
  def index
    @pics = Pic.all
  end

  def show

  end

  def new
    # @pic = Pic.new
    @pic = current_user.pics.build
  end

  def create
    @pic = current_user.pics.build(pic_params)

    if @pic.save
      redirect_to @pic
    else
      render 'new'
    end
  end

  def edit

  end

  def update

    if @pic.update(params[:pic].permit(:title,:description))
      redirect_to @pic
    else
      render 'edit'
    end
  end

  def destroy

    @pic.destroy

    redirect_to root_path
  end

  private
  def pic_params
    params.require(:pic).permit(:title, :description)
  end

  def pic_find
    @pic = Pic.find(params[:id])
  end
end
