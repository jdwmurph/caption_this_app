require 'spec_helper'

describe User do
  it 'should have a name' do
    bobby = User.create(name: 'Bobby')
    actual = bobby.name
    expected = 'Bobby'
    expect(actual).to eq expected
  end
end
