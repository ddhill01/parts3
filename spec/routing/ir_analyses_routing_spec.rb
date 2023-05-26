require "rails_helper"

RSpec.describe IrAnalysesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/ir_analyses").to route_to("ir_analyses#index")
    end

    it "routes to #new" do
      expect(get: "/ir_analyses/new").to route_to("ir_analyses#new")
    end

    it "routes to #show" do
      expect(get: "/ir_analyses/1").to route_to("ir_analyses#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/ir_analyses/1/edit").to route_to("ir_analyses#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/ir_analyses").to route_to("ir_analyses#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/ir_analyses/1").to route_to("ir_analyses#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/ir_analyses/1").to route_to("ir_analyses#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/ir_analyses/1").to route_to("ir_analyses#destroy", id: "1")
    end
  end
end
