require 'spec_helper'

describe Image do
  it 'should have a user' do
    bobby = User.create(name: 'Bobby')
    image = Image.create(image_url: 'www.espn.com')
    bobby.images << image
    actual = image.user.name
    expected = 'Bobby'
    expect(actual).to eq expected
  end
end
