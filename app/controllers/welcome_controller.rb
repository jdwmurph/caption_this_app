class WelcomeController < ApplicationController
  before_action:current_user

  def index
    @image = Image.first
    @captions = @image.captions
    if @captions
       @captions_sorted = @captions.sort {|caption_2, caption_1| caption_1.get_upvotes.size <=> caption_2.get_upvotes.size}
    end
    if @captions_sorted
      @caption_top = @captions_sorted.first
    end
  end

end
