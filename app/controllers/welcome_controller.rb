class WelcomeController < ApplicationController
  before_action:current_user

  def index
    @captions = Caption.all

    @captions = @captions.sort {|caption_2, caption_1| caption_1.get_upvotes.size <=> caption_2.get_upvotes.size}
  end

end
