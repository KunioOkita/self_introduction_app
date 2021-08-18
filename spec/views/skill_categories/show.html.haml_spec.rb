require 'rails_helper'

RSpec.describe "skill_categories/show", type: :view do
  before(:each) do
    @skill_category = assign(:skill_category, SkillCategory.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
