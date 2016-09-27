require 'rails_helper'

feature 'commenting' do
  context 'leaving a comment for an image' do
    let!(:doggy){ Image.create(name: "Doggy", category: "Animals") }
    scenario 'allows users to leave a comment using a text area' do
      visit '/images'
      click_link 'Doggy'
      fill_in 'Comment', with: "Aw, so cute"
      click_button 'Post'
      expect(page).to have_content "Aw, so cute"
      expect(current_path).to eq "/images/#{doggy.id}"
    end
  end
end
