require 'rails_helper'

RSpec.describe "skill_categories/edit", type: :view do
  before(:each) do
    @skill_category = assign(:skill_category, SkillCategory.create!(
      name: "MyString"
    ))
  end

  it "renders the edit skill_category form" do
    render

    assert_select "form[action=?][method=?]", skill_category_path(@skill_category), "post" do

      assert_select "input[name=?]", "skill_category[name]"
    end
  end
end
