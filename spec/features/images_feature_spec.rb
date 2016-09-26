require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to add upload an image' do
      visit 'images'
      expect(page).to have_content 'No images have been uploaded yet :('
      expect(page).to have_link 'Upload an image'
    end
  end

  context 'images have been added' do
    before do
      Image.create(name: 'Cat', category: 'Animals')
    end

    scenario 'displays images' do
      visit '/images'
      expect(page).to have_content 'Cat'
      expect(page).to have_content 'Category: Animals'
      expect(page).not_to have_content('No images have been uploaded yet :(')
    end
  end
end
