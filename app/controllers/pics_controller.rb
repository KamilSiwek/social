class PicsController < ApplicationController
  before_action :pic_find, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]
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
      redirect_to @pic, notice: "It was posted!"
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @pic.update(pic_params)
      redirect_to @pic
    else
      render 'edit'
    end
  end

  def destroy
    @pic.destroy

    redirect_to root_path
  end

  def upvote
    @pic.upvote_by current_user
    redirect_back fallback_location: @pic
  end

  def downvote
    @pic.downvote_by current_user
    redirect_back fallback_location: @pic
  end

  private
  def pic_params
    params.require(:pic).permit(:title, :description, :image)
  end

  def pic_find
    @pic = Pic.find(params[:id])
  end
end
