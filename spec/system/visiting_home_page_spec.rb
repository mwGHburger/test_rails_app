require 'rails_helper'

RSpec.describe "Visit the home page", type: :system do
    # before { driven_by(:selenium_chrome) } ---> Used by default, method 1
    before { driven_by(:rack_test) } # method 2
    it "should render home page with relevant headings" do
        visit "/" # create ruby object called page
        expect(page).to have_text("My HomePage")
    end
end