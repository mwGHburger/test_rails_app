require 'rails_helper'

RSpec.describe "Updating a user", type: :system do
    before { driven_by(:rack_test)}

    it "updates a user"do 
        # need an existing user
        user = User.create({name: "Bob"})
        visit "/#{user.id}/edit"

        fill_in "Name", with: "New"
        fill_in "Age", with: 100

        click_button "Update User"

        expect(page).to have_text("User was successfully updated.")
    end
end