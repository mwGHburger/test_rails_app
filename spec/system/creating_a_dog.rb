require "rails_helper"

RSpec.describe "creating a new dog", type: :system do
    before {driven_by(:rack_test)}
    it "creates a new dog" do
        visit "/dogs/new"

        fill_in "Breed", with: "Pitbull"

        click_button "Create Dog"

        expect(page).to have_text("Dog was successfully created.")

        dog = Dog.last

        expect(dog.breed).to eq("Pitbull")
    end
end
