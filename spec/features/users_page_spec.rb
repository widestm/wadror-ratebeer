require 'rails_helper'

describe "User page" do 
	let!(:user) { FactoryGirl.create :user }

	before :each do
		sign_in(username:"Pekka", password:"Foobar1")
		create_beers_with_ratings(1, 2, 3, 4, 5, user)

	end

	it "should only show a user his own ratings" do 
		visit user_path(user)
		expect(page).to have_content "anonymous 1"
		expect(page).to have_content "anonymous 2"
		expect(page).to have_content "anonymous 3"
		expect(page).to have_content "anonymous 4"
		expect(page).to have_content "anonymous 5"
	end

	it "deletes ratings properly" do
		visit user_path(user)
		expect(Rating.count).to eq(5)
		page.all('a')[9].click   #ugly hack for deleting first rating :(
		expect(page).to_not have_content "anonymous 1"
		expect(Rating.count).to eq(4)
	end
end