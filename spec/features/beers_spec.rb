require 'rails_helper'

describe "Beer" do
	let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
	let!(:user) { FactoryGirl.create :user }
	let!(:style){FactoryGirl.create :style}

	before :each do
		sign_in(username:"Pekka", password:"Foobar1")
	end

	it "is added if valid attributes" do
		visit new_beer_path
		
		select('style1', from:'beer[style_id]')
		select('Koff', from:'beer[brewery_id]')
		fill_in('beer[name]', with:'testi')
		expect{
			click_button "Create Beer"
			}.to change{Beer.count}.from(0).to(1)
		end

		it "is not added without a name" do
			visit new_beer_path
			select('style1', from:'beer[style_id]')
			select('Koff', from:'beer[brewery_id]')

			expect{
				click_button "Create Beer"
				}.to_not change{Beer.count}

				expect(page).to have_content "Name can't be blank"
				expect(current_path).to eq(beers_path)
			end
		end
