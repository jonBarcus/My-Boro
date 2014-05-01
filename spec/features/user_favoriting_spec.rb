require 'spec_helper'

describe "A user can favorite a drink" do
  before(:each) do
    @user = User.create(name: "Joshua", email: "joshua@joshua.com", password: "1234", password_confirmation: "1234")
  end

  it "adds a drink to their drinks", js: true do
    drink = Drink.create(name: "Fred's")
    # given a logged in user
    visit "/"
    find("#log_in").click
    within("#form2") do
      fill_in("Email", :with => @user.email)
      fill_in("Password", :with => @user.password)
      click_button "Login"
    end
    # when they click on restaursnts
    find("#drink_icon").click
    # and they click on a drink to favorite
    # binding.pry
    # sleep
    # card = first(".drink-card")
    # card.find("button").click
  # then the drink should be added to their drinks

   expect( @user.drinks ).to eq [ drink ]
    # and the favorites button for that drink should go away
    expect( drinkButton ).not_to be_visible
    # and be replaced with "You've saved this drink!"
     # within( ) TODO: add wrapper to each drink info card to semantically group them
    expect( page ).to have_content("You've saved this drink!")
  end


end
