require 'rails_helper'

RSpec.describe "visting about page", type: :system do
    before { driven_by(:rack_test)}

    it "visits about#index page" do
        visit "/about/index"

        expect(page).to have_text("Michael's About Page")
    end
end