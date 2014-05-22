require 'spec_helper'

describe Caption do
  it 'should have a message' do
    new_caption = Caption.create(message: 'hello')
    actual = new_caption.message
    expected = 'hello'
    expect(actual).to eq expected
  end

  it 'should have an image and a user' do
    new_caption = Caption.create(message: 'hello')
    new_image = Image.create(image_url: 'www.espn.com')
    new_user = User.create(name: 'bod')
    new_user.images << new_image
    new_image.captions << new_caption
    new_user.captions << new_caption
    actual = new_caption.user.images.first.captions.first.message
    expected = 'hello'
    expect(actual).to eq expected
  end
end
