# require 'spec_helper'

# describe "sign up process", js: true do
#   #let(:user) {User.new(:name)}
#   describe "with correct info" do
#     it "should sign up a new user" do
#       visit "/"
#       # click_link "#sign_up"
#       find("#sign_up").click
#       # form info
#       within "#new_user" do
#         fill_in "user[name]", with: "Carolyn"
#         fill_in "Email", with: "cganon@gmail.com"
#         fill_in "Password", with: "password"
#         fill_in "Password confirmation", with: "password"
#       end
#       click_button "Create User"
#       expect(page).to have_content("Sign up successful!")
#     end
#   end

#   describe "with incorrect info" do
#     it "should sign up a new user" do
#       visit "/"
#       # click_link "#sign_up"
#       find("#sign_up").click
#       # form info
#       within "#new_user" do
#         fill_in "user[name]", with: "Carolyn"
#         fill_in "Email", with: "cganon@gmail.com"
#         fill_in "Password", with: "password"
#         fill_in "Password confirmation", with: "passwrod"
#       end
#       click_button "Create User"
#       expect(page).to have_content("Something went wrong! Please try again.")
#     end
#   end



# end

# # test for success and failures(but first write validations)
