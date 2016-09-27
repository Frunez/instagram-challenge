require 'rails_helper'

describe Image, type: :model do
  it 'is not valid with an empty name' do
    image = Image.new(name: '')
    expect(image).to have(1).error_on(:name)
    expect(image).not_to be_valid
  end
end
