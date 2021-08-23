require "rails_helper"

RSpec.describe "divisions/new", type: :view do
  before(:each) do
    assign(:division, Division.new(
      name: "MyString",
      department: nil
    ))
  end

  it "renders new division form" do
    render

    assert_select "form[action=?][method=?]", divisions_path, "post" do
      assert_select "input[name=?]", "division[name]"

      assert_select "input[name=?]", "division[department_id]"
    end
  end
end
