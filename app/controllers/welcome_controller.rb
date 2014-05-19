class WelcomeController < ApplicationController
  before_action:current_user
  helper_method :user_caption_score

  def index
    @image = Image.first
    @captions = @image.captions
    @captions_sorted = @captions.sort {|caption_2, caption_1| caption_1.get_upvotes.size <=> caption_2.get_upvotes.size}
    @caption_top = @captions_sorted.first
  end

  def rankings
    users = User.all
    # users_with_caption_scores = {}
    # users.each {|user| users_with_caption_scores[:user] = user_caption_score(user)}

    users_sorted_by_caption_score = users.sort {|user_1, user_2| user_caption_score(user_2) <=> user_caption_score(user_1)}
    @first_ten_users = users_sorted_by_caption_score.first(10)
  end

  def user_caption_score(user)
    total_user_score = 0
    user.captions.each do |caption|
      caption_score = caption.get_upvotes.size - caption.get_downvotes.size
      total_user_score += caption_score
    end
    total_user_score
  end

end
