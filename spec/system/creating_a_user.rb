require 'rails_helper'

=begin
    1. go to the new user page
    2. submit valid details
    3. when details submitted, it creates user + renders success text
=end

RSpec.describe "Creating a new user", type: :system do
    # before { driven_by(:selenium_chrome) } ---> Used by default, method 1
    before { driven_by(:rack_test) } # method 2

    it "creates a new user" do
        visit "/new"

        fill_in "Name", with: "Steve" # looks for label to insert value
        fill_in "Age", with: 87
        # page at this point is the "New" page

        click_button "Create User"
        
        # page at this point is the "New" page
        # page represents the last page capybara has seen
        expect(page).to have_text("User was successfully created.")
        
        # helpers are in capybara docs
    end
end