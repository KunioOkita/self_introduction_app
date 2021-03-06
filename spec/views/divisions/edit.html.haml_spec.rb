require "rails_helper"

RSpec.describe "divisions/edit", type: :view do
  before(:each) do
    @division = assign(:division, Division.create!(
      name: "MyString",
      department: nil
    ))
  end

  it "renders the edit division form" do
    render

    assert_select "form[action=?][method=?]", division_path(@division), "post" do
      assert_select "input[name=?]", "division[name]"

      assert_select "input[name=?]", "division[department_id]"
    end
  end
end
