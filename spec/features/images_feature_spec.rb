require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to add upload an image' do
      visit 'images'
      expect(page).to have_content 'No images have been uploaded yet :('
      expect(page.to have_link 'Upload an image')
    end
  end
end
