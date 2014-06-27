class UsersController < ApplicationController
  before_action:current_user

  # Holy helper methods Batman! Why? So many methods indicate an object is waiting to get out.
  # We had a conversation about these, I think.
  helper_method :caption_score, :image_score, :user_caption_score, :user_image_score, :user_image_rank, :user_caption_rank

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to log_in_path
    else
      render new_user_path
    end
  end

  def show
    @published_count = @current_user.images.select {|image| image.published == true}.count
    @user_count = User.all.count
  end


  def user_caption_rank(user)
    users = User.all
    users_sorted_by_caption_score = users.sort {|user_1, user_2| user_caption_score(user_2) <=> user_caption_score(user_1)}
    score = users_sorted_by_caption_score.index(user) + 1
    score
  end

  def user_image_rank(user)
    users = User.all
    users_sorted_by_image_score = users.sort {|user_1, user_2| user_image_score(user_2) <=> user_image_score(user_1)}
    score = users_sorted_by_image_score.index(user) + 1
    score
  end


  def user_caption_score(user)
    total_user_score = 0
    captions_for_published_images = user.captions.select {|caption| caption.image.published == true}
    captions_for_published_images.each do |caption|
      total_user_score += caption_score(caption)
    end
    total_user_score
  end

  def user_image_score(user)
    total_user_score = 0
    published_images = user.images.select {|image| image.published == true}
    published_images.each do |image|
      image.captions.each do |caption|
        total_user_score += caption_score(caption)
      end
    end
    total_user_score
  end

  def image_score(image)
    score = 0
    image.captions.each do |caption|
      score += caption_score(caption)
    end
    score
  end

  def caption_score(caption)
    score = caption.get_upvotes.size - caption.get_downvotes.size
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
