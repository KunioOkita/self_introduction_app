require 'rails_helper'

RSpec.describe "divisions/show", type: :view do
  before(:each) do
    @division = assign(:division, Division.create!(
      name: "Name",
      department: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
