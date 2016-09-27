require 'rails_helper'

feature 'comment' do

  let!(:octo){ Image.create(name: 'Pancake', category: 'Food') }

  context 'commenting on an image' do
    scenario 'allows users to leave a comment on images' do
      visit '/images'
      click_link 'Pancake'
      fill_in 'Comment', with: 'Mmm, tasty'
      click_button 'Post'
      expect(page).to have_content 'Mmm, tasty'
      expect(current_path).to eq "/images/#{octo.id}"
    end
  end
end
