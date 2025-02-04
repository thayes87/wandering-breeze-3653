require 'rails_helper'

RSpec.describe Project, type: :feature do
  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
  
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
  end
  describe 'As a visitor' do
    describe 'When I visit a project\'s show page' do
      it 'shows the projects name and material' do

        visit "/projects/#{@news_chic.id}"

          expect(page).to have_content("Name: News Chic")
          expect(page).to have_content("Material: Newspaper")
      end
      
      it 'also show the theme of the challenge that the project belongs to' do
        
        visit "/projects/#{@news_chic.id}"

        expect(page).to have_content("Challenge Theme: Recycled Material")
      end
      
      it 'shows a count of the number of contestants on this project' do

        visit "/projects/#{@news_chic.id}"

        expect(page).to have_content("Number of Contestants: 2")
      end

      it 'shows the average years of experience for the contestants that worked on that project' do

        visit "/projects/#{@news_chic.id}"
save_and_open_page
        expect(page).to have_content("Average Contestant Experience: 12.5 years")
      end
    end
  end
end