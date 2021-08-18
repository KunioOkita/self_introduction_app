require 'rails_helper'

RSpec.describe "skill_categories/index", type: :view do
  before(:each) do
    assign(:skill_categories, [
      SkillCategory.create!(
        name: "Name"
      ),
      SkillCategory.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of skill_categories" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
