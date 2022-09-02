require 'rails_helper'

RSpec.describe Project, type: :feature do
  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
  
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
  end
  describe 'As a visitor' do
    describe 'When I visit a project\'s show page' do
      it 'shows the projects name and material' do

        visit "/projects/#{@news_chic.id}"

          expect(page).to have_content("News Chic")
          expect(page).to have_content("Newspaper")
      end
      it 'also show the theme of the challenge that the project belongs to' do
y
        visit "/projects/#{@news_chic.id}"
save_and_open_page
        expect(page).to have_content("Recycled Material")
      end
    end
  end
end