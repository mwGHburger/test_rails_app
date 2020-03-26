require 'rails_helper'

RSpec.describe "Deleting a user", type: :system do
    before {driven_by(:rack_test)}
    it "deletes user" do
        User.create({name: "Bob"})
        visit "/"

        click_link "Destroy"

        expect(page).to have_text("User was successfully destroyed.")
    end
end