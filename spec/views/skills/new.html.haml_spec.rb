require 'rails_helper'

RSpec.describe "skills/new", type: :view do
  before(:each) do
    assign(:skill, Skill.new(
      name: "MyString",
      skill_category: nil
    ))
  end

  it "renders new skill form" do
    render

    assert_select "form[action=?][method=?]", skills_path, "post" do

      assert_select "input[name=?]", "skill[name]"

      assert_select "input[name=?]", "skill[skill_category_id]"
    end
  end
end
