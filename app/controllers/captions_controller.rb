class CaptionsController < ApplicationController

  before_action:current_user

  def create
    @current_user.captions << Caption.create(caption_params)
    redirect_to '/'
  end

  def upvote
    caption = Caption.find(params[:caption_id])
    user = User.find(params[:id])
    caption.liked_by user
    redirect_to '/'
  end

  def downvote
    caption = Caption.find(params[:caption_id])
    user = User.find(params[:id])
    caption.downvote_from user
    redirect_to '/'
  end

  private
  def caption_params
    params.require(:caption).permit(:message)
  end

end
