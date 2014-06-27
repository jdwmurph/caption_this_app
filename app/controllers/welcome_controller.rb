class WelcomeController < ApplicationController
  before_action:current_user

  helper_method :user_caption_score, :user_image_score, :caption_score, :image_score

  def index
    @image = Image.first
    @captions = @image.captions
    @captions_sorted = @captions.sort {|caption_2, caption_1| caption_1.get_upvotes.size <=> caption_2.get_upvotes.size}
    @caption_top = @captions_sorted.first
    @images = Image.all.select {|image| image.published == true}
  end

  def rankings
    users = User.all
    users_sorted_by_caption_score = users.sort {|user_1, user_2| user_caption_score(user_2) <=> user_caption_score(user_1)}
    @first_ten_users = users_sorted_by_caption_score.first(10)

    users_sorted_by_image_score = users.sort {|user_1, user_2| user_image_score(user_2) <=> user_image_score(user_1)}
    @first_ten_users_img = users_sorted_by_image_score.first(10)

    captions = Caption.all
    captions = captions.select {|caption| caption.image.published == true}
    @caption_count = captions.count
    captions_sorted_by_score = captions.sort {|caption_2, caption_1| caption_score(caption_1) <=> caption_score(caption_2)}
    @top_ten_captions = captions_sorted_by_score.first(10)

    images = Image.all
    images = images.select {|image| image.published == true}
    @image_count = images.count
    images_sorted_by_score = images.sort {|image_2, image_1| image_score(image_1) <=> image_score(image_2)}
    @top_ten_images = images_sorted_by_score.first(10)
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

end
