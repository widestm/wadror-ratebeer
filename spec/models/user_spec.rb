require 'rails_helper'

describe User do
	it "has the username set correctly" do
		user = User.new username:"Pekka"

		expect(user.username).to eq("Pekka")
	end

	it "is not saved without a password" do
		user = User.create username:"Pekka"

		expect(user).not_to be_valid
		expect(User.count).to eq(0)
	end
	describe "with a proper password" do
		let(:user){ FactoryGirl.create(:user) }

		it "is saved" do
			expect(user).to be_valid
			expect(User.count).to eq(1)
		end

		it "and with two ratings, has the correct average rating" do
			user.ratings << FactoryGirl.create(:rating)
			user.ratings << FactoryGirl.create(:rating2)

			expect(user.ratings.count).to eq(2)
			expect(user.average_rating).to eq(15.0)
		end
	end
	describe "with a too short password" do
		
		let(:user){User.create username:"Pekka", password:"pS1", password_confirmation:"pS1"}
		
		it "is not saved" do
			expect(user).not_to be_valid
			expect(User.count).to eq(0)
		end
	end
	describe "with an invalid password" do
		
		let(:user){User.create username:"Pekka", password:"password234", password_confirmation:"password234"}
		
		it "is not saved" do
			expect(user).not_to be_valid
			expect(User.count).to eq(0)
		end
	end
	
	it "has method for determining the favorite_beer" do
		user = FactoryGirl.create(:user)
		expect(user).to respond_to(:favorite_beer)
	end
end