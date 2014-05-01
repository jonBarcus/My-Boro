require 'spec_helper'

describe "A user can favorite a restaurant" do
  before(:each) do
    @user = User.create(name: "Joshua", email: "joshua@joshua.com", password: "1234", password_confirmation: "1234")
  end

  it "adds a restaurant to their restaurants", js: true do
    restaurant = Restaurant.create(name: "Fred's")
    # given a logged in user
    visit "/"
    find("#log_in").click
    within("#form2") do
      fill_in("Email", :with => @user.email)
      fill_in("Password", :with => @user.password)
      click_button "Login"
    end
    # when they click on restaursnts
    find("#food_icon").click
    # and they click on a restaurant to favorite
    # binding.pry
    # sleep
    # card = first(".restaurant-card")
    # card.find("button").click
  # then the restaurant should be added to their restaurants

   expect( user.restaurants ).to eq [ restaurant ]
    # and the favorites button for that restaurant should go away
    expect( restaurantButton ).not_to be_visible
    # and be replaced with "You've saved this restaurant!"
     # within( ) TODO: add wrapper to each restaurant info card to semantically group them
    expect( page ).to have_content("You've saved this restaurant!")
  end


end
