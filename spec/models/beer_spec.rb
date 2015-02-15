require 'rails_helper'

describe Beer do
	it "is saved and valid if given name and style" do 
		beer = Beer.create name:"iso3", style_id:"1"
		
		expect(beer).to be_valid
		expect(Beer.count).to eq(1)
	end
	it "is not saved without a name" do
		beer = Beer.create style_id:"1"
		expect(beer).not_to be_valid
		expect(Beer.count).to eq(0)
	end
	it "is not saved without a proper style" do
		beer = Beer.create name:"iso3"
		expect(beer).not_to be_valid
		expect(Beer.count).to eq(0)
	end
end
