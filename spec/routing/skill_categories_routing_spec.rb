require "rails_helper"

RSpec.describe SkillCategoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/skill_categories").to route_to("skill_categories#index")
    end

    it "routes to #new" do
      expect(get: "/skill_categories/new").to route_to("skill_categories#new")
    end

    it "routes to #show" do
      expect(get: "/skill_categories/1").to route_to("skill_categories#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/skill_categories/1/edit").to route_to("skill_categories#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/skill_categories").to route_to("skill_categories#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/skill_categories/1").to route_to("skill_categories#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/skill_categories/1").to route_to("skill_categories#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/skill_categories/1").to route_to("skill_categories#destroy", id: "1")
    end
  end
end
