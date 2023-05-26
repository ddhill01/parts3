require "rails_helper"

RSpec.describe AssetNoteGroupsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/asset_note_groups").to route_to("asset_note_groups#index")
    end

    it "routes to #new" do
      expect(get: "/asset_note_groups/new").to route_to("asset_note_groups#new")
    end

    it "routes to #show" do
      expect(get: "/asset_note_groups/1").to route_to("asset_note_groups#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/asset_note_groups/1/edit").to route_to("asset_note_groups#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/asset_note_groups").to route_to("asset_note_groups#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/asset_note_groups/1").to route_to("asset_note_groups#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/asset_note_groups/1").to route_to("asset_note_groups#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/asset_note_groups/1").to route_to("asset_note_groups#destroy", id: "1")
    end
  end
end
