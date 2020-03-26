require 'rails_helper'

RSpec.describe "dogs/index", type: :view do
  before(:each) do
    assign(:dogs, [
      Dog.create!(
        :breed => "Breed"
      ),
      Dog.create!(
        :breed => "Breed"
      )
    ])
  end

  it "renders a list of dogs" do
    render
    assert_select "tr>td", :text => "Breed".to_s, :count => 2
  end
end
