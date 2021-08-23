require "rails_helper"

RSpec.describe "skill_categories/new", type: :view do
  before(:each) do
    assign(:skill_category, SkillCategory.new(
      name: "MyString"
    ))
  end

  it "renders new skill_category form" do
    render

    assert_select "form[action=?][method=?]", skill_categories_path, "post" do
      assert_select "input[name=?]", "skill_category[name]"
    end
  end
end
