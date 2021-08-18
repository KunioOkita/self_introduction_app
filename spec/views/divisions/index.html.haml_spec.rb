require 'rails_helper'

RSpec.describe "divisions/index", type: :view do
  before(:each) do
    assign(:divisions, [
      Division.create!(
        name: "Name",
        department: nil
      ),
      Division.create!(
        name: "Name",
        department: nil
      )
    ])
  end

  it "renders a list of divisions" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
