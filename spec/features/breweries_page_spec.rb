require 'rails_helper'

describe "Breweries page" do
 
  it "should not have any before been created" do
    visit breweries_path
    expect(page).to have_content 'Listing breweries'
    expect(page).to have_content 'Number of retired breweries: 0'
    expect(page).to have_content 'Number of active breweries: 0'
  end

  describe "when breweries exists" do
    before :each do
      @active_breweries = ["Koff", "Karjala", "Schlenkerla"]
      @retired_breweries = ["Suomenlinnan_panimo", "Brew_dog"]
      year = 1896

      @active_breweries.each do |brewery_name|
        FactoryGirl.create(:brewery, name: brewery_name, year: year += 1, active: true)
      end

      @retired_breweries.each do |brewery_name|
        FactoryGirl.create(:brewery, name: brewery_name, year: year += 1, active: false)
      end

      visit breweries_path
    end

    it "lists all active breweries and their total count" do
      expect(page).to have_content "Number of active breweries: #{@active_breweries.count}"
      @active_breweries.each do |brewery_name|
        expect(page).to have_content brewery_name
      end
    end

    it "lists all retired breweries and their total count" do
      expect(page).to have_content "Number of retired breweries: #{@retired_breweries.count}"
      @retired_breweries.each do |brewery_name|
        expect(page).to have_content brewery_name
      end
    end

    it "allows user to navigate to page of an active Brewery" do
      click_link "Koff"

      expect(page).to have_content "Koff"
      expect(page).to have_content "Established in 1897"
    end

    it "allows user to navigate to page of a retired Brewery" do
      click_link "Suomenlinnan_panimo"

      expect(page).to have_content "Suomenlinnan_panimo"
      expect(page).to have_content "Established in 1900"
      expect(page).to have_content "retired"
    end

  end
end