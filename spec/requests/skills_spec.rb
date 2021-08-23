 require "rails_helper"

 # This spec was generated by rspec-rails when you ran the scaffold generator.
 # It demonstrates how one might use RSpec to test the controller code that
 # was generated by Rails when you ran the scaffold generator.
 #
 # It assumes that the implementation code is generated by the rails scaffold
 # generator. If you are using any extension libraries to generate different
 # controller code, this generated spec may or may not pass.
 #
 # It only uses APIs available in rails and/or rspec-rails. There are a number
 # of tools you can use to make these specs even more expressive, but we're
 # sticking to rails and rspec-rails APIs to keep things simple and stable.

 RSpec.describe "/skills", type: :request do
   # Skill. As you add validations to Skill, be sure to
   # adjust the attributes here as well.
   let(:valid_attributes) {
     skip("Add a hash of attributes valid for your model")
   }

   let(:invalid_attributes) {
     skip("Add a hash of attributes invalid for your model")
   }

   describe "GET /index" do
     it "renders a successful response" do
       Skill.create! valid_attributes
       get skills_url
       expect(response).to be_successful
     end
   end

   describe "GET /show" do
     it "renders a successful response" do
       skill = Skill.create! valid_attributes
       get skill_url(skill)
       expect(response).to be_successful
     end
   end

   describe "GET /new" do
     it "renders a successful response" do
       get new_skill_url
       expect(response).to be_successful
     end
   end

   describe "GET /edit" do
     it "render a successful response" do
       skill = Skill.create! valid_attributes
       get edit_skill_url(skill)
       expect(response).to be_successful
     end
   end

   describe "POST /create" do
     context "with valid parameters" do
       it "creates a new Skill" do
         expect {
           post skills_url, params: { skill: valid_attributes }
         }.to change(Skill, :count).by(1)
       end

       it "redirects to the created skill" do
         post skills_url, params: { skill: valid_attributes }
         expect(response).to redirect_to(skill_url(Skill.last))
       end
     end

     context "with invalid parameters" do
       it "does not create a new Skill" do
         expect {
           post skills_url, params: { skill: invalid_attributes }
         }.to change(Skill, :count).by(0)
       end

       it "renders a successful response (i.e. to display the 'new' template)" do
         post skills_url, params: { skill: invalid_attributes }
         expect(response).to be_successful
       end
     end
   end

   describe "PATCH /update" do
     context "with valid parameters" do
       let(:new_attributes) {
         skip("Add a hash of attributes valid for your model")
       }

       it "updates the requested skill" do
         skill = Skill.create! valid_attributes
         patch skill_url(skill), params: { skill: new_attributes }
         skill.reload
         skip("Add assertions for updated state")
       end

       it "redirects to the skill" do
         skill = Skill.create! valid_attributes
         patch skill_url(skill), params: { skill: new_attributes }
         skill.reload
         expect(response).to redirect_to(skill_url(skill))
       end
     end

     context "with invalid parameters" do
       it "renders a successful response (i.e. to display the 'edit' template)" do
         skill = Skill.create! valid_attributes
         patch skill_url(skill), params: { skill: invalid_attributes }
         expect(response).to be_successful
       end
     end
   end

   describe "DELETE /destroy" do
     it "destroys the requested skill" do
       skill = Skill.create! valid_attributes
       expect {
         delete skill_url(skill)
       }.to change(Skill, :count).by(-1)
     end

     it "redirects to the skills list" do
       skill = Skill.create! valid_attributes
       delete skill_url(skill)
       expect(response).to redirect_to(skills_url)
     end
   end
 end
