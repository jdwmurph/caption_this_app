require 'spec_helper'

describe Caption do
  it 'should have a message' do
    new_caption = Caption.create(message: 'hello')
    actual = new_caption.message
    expected = 'hello'
  end
end
