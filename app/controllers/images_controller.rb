class ImagesController < ApplicationController
  before_action:current_user


  def new

    url = "https://api.instagram.com/v1/media/popular?access_token=#{ENV.fetch('INSTAGRAM_TOKEN')}"
    result = HTTParty.get(url)
    @image_url = result['data'][1]['images']['standard_resolution']['url']

    # headers = {"Content-Type": "text", "Authorization": "Client-ID <%= ENV.fetch('IMGUR_KEY')%>"}
    # r = requests.get("https://api.imgur.com/3/gallery/random/random/<%= 1 %>", headers=headers, verify=False)
    # @imgur_url
  end

  def create
    new_image = Image.create(image_params)
    @current_user.images << new_image
    redirect_to user_path(@current_user)
  end

  def show
    num = params[:id].to_i

    if Image.exists?(num) && Image.find(num).published == true
      @image = Image.find(num)
    end

    while @image == nil
      if Image.exists?(num) && Image.find(num).published == true
        redirect_to image_path(num) and return
      elsif num > Image.last!.id
        redirect_to "/images/last_one" and return
      else
        num+=1
      end
    end
    @next_image_id = @image.id + 1
    @captions = @image.captions
    @captions = @captions.sort {|caption_2, caption_1| caption_score(caption_1) <=> caption_score(caption_2)}
  end

  def destroy
    Image.delete(params[:id])
    redirect_to user_path(@current_user)
  end

  def last
  end

  def publisher
    image = Image.find(params[:id])
    image.update(image_params)
    redirect_to user_path(image.user)
  end

  def caption_score(caption)
    score = caption.get_upvotes.size - caption.get_downvotes.size
  end

  private
  def image_params
    params.require(:image).permit(:image_url, :published)
  end
end
