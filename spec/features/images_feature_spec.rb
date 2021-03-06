require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to add an image' do
      visit '/images'
      expect(page).to have_content 'No images have been uploaded yet :('
      expect(page).to have_link 'upload-an-image'
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

  context 'creating images' do
    scenario 'prompts user to fill out a form, then displays the new image' do
      visit '/images'
      click_link 'upload-an-image'
      fill_in 'Name', with: 'Cat'
      click_button 'Upload'
      expect(page).to have_content 'Cat'
      expect(current_path).to include '/images/'
    end
    scenario 'does not let you submit an empty field' do
      visit '/images'
      click_link 'upload-an-image'
      fill_in 'Name', with: ''
      click_button 'Upload'
      expect(page).to have_content 'Don\'t be lazy, give your image a name'
      expect(page).not_to have_css 'strong', text: ''
    end
  end

  context 'viewing images' do

    let!(:cat){ Image.create(name: 'Cat', category: 'Animals') }

    scenario 'lets users view a single image' do
      visit '/images'
      click_link 'Cat'
      expect(page).to have_content 'Cat'
      expect(page).to have_content 'Category: Animals'
      expect(current_path).to eq "/images/#{cat.id}"
    end
  end

  context 'updating images' do

    let!(:car){ Image.create(name: 'Car', category: 'Sports') }

    scenario 'lets a user edit an image' do
      visit '/images'
      click_link 'Car'
      click_link 'Edit'
      fill_in 'Name', with: 'Lexus'
      fill_in 'Category', with: 'Automobiles'
      click_button 'Update'
      expect(page).to have_content 'Lexus'
      expect(page).to have_content 'Category: Automobiles'
      expect(current_path).to eq "/images/#{car.id}"
    end
  end

  context 'deleting images' do

    before { Image.create(name: 'Octopus', category: 'Sea') }

    scenario 'removes image when user clicks remove' do
      visit '/images'
      click_link 'Octopus'
      click_link 'Remove'
      expect(page).to have_content 'Image successfully removed'
      expect(page).not_to have_content 'Octopus'
    end
  end
end
