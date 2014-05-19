class ImagesController < ApplicationController
  before_action:current_user

  def new
    url = 'https://api.instagram.com/v1/media/popular?access_token=1334546166.f59def8.1875f03b73e04642b9461f56999d0e14'
    result = HTTParty.get(url)
    @image_url = result['data'][1]['images']['standard_resolution']['url']
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
    @captions = @captions.sort {|caption_2, caption_1| caption_1.get_upvotes.size - caption_1.get_downvotes.size <=> caption_2.get_upvotes.size - caption_2.get_downvotes.size}
  end

  def last
  end

  def publish
    image = Image.find(params[:id])
    image.update(published: true)

    redirect_to image_path(image)
  end

  private
  def image_params
    params.require(:image).permit(:image_url)
  end
end
