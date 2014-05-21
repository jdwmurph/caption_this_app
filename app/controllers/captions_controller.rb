class CaptionsController < ApplicationController

  before_action:current_user


  def create
    new_caption = Caption.create(caption_params)
    @current_user.captions << new_caption
    @image = Image.find(new_caption.image)
    redirect_to image_path(@image)
  end

  def upvote
    caption = Caption.find(params[:id])
    user = User.find(params[:user_id])
    caption.liked_by user
    redirect_to image_path(caption.image)
  end

  def downvote
    caption = Caption.find(params[:id])
    user = User.find(params[:user_id])
    caption.downvote_from user
    redirect_to image_path(caption.image)
  end

  def destroy
    Caption.delete(params[:id])
    binding.pry
    redirect_to user_path(@current_user)
  end

  private
  def caption_params
    params.require(:caption).permit(:message, :user_id, :image_id)
  end

end
