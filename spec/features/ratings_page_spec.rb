require 'rails_helper'

describe "Ratings page" do
  it "should not have any before been created" do
    visit ratings_path
    expect(page).to have_content 'Number of ratings 0'
  end
end

describe "when ratings exist" do
  let!(:user) { FactoryGirl.create :user }

  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
  end

  it "they are shown on page" do
    create_beers_with_ratings(10, 20, 15, 7, 9, user)

    expect(Rating.count).to eq(5)
    visit ratings_path

    expect(page).to have_content "Number of ratings 5"
    expect(page).to have_content "anonymous 10 Pekka"
    expect(page).to have_content "anonymous 20 Pekka"
    expect(page).to have_content "anonymous 15 Pekka"
    expect(page).to have_content "anonymous 7 Pekka"
    expect(page).to have_content "anonymous 9 Pekka"
  end
end