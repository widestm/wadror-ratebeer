require 'rails_helper'

describe "Places" do
	it "if one is returned by the API, it is shown at the page" do
		allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
			[ Place.new( name:"Oljenkorsi", id: 1 ) ]
			)

		visit places_path
		fill_in('city', with: 'kumpula')
		click_button "Search"
		expect(page).to have_content "Oljenkorsi"
	end
	it "if multiple places are returned by API, they are all shown on the page" do
		allow(BeermappingApi).to receive(:places_in).with("testikyla").and_return(
			[ Place.new( name:"Oljenkorsi", id: 1 ), 
				Place.new( name:"testikylanBaari", id: 2 )  ]
				)
		visit places_path
		fill_in('city', with: 'testikyla')
		click_button "Search"
		expect(page).to have_content "Oljenkorsi"
		expect(page).to have_content "testikylanBaari"
	end
	it "if no place is found at the location, there is a notice of it" do
		allow(BeermappingApi).to receive(:places_in).with("pasila").and_return(
			[])

		visit places_path
		fill_in('city', with: 'pasila')
		click_button "Search"
		expect(page).to have_content "No locations in pasila"
	end
end