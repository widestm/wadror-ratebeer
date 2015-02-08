require 'rails_helper'

describe "Beer" do
	let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }

	it "is added if valid attributes" do
		visit new_beer_path
		
		
		select('Weizen', from:'beer[style]')
		select('Koff', from:'beer[brewery_id]')
		fill_in('beer[name]', with:'testi')
		expect{
			click_button "Create Beer"
			}.to change{Beer.count}.from(0).to(1)
		end

		it "is not added without a name" do
			visit new_beer_path
			select('Weizen', from:'beer[style]')
			select('Koff', from:'beer[brewery_id]')

			expect{
				click_button "Create Beer"
				}.to_not change{Beer.count}

				expect(page).to have_content "Name can't be blank"
				expect(current_path).to eq(beers_path)
			end
		end
