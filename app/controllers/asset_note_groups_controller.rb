class AssetNoteGroupsController < ApplicationController
  before_action :set_asset_note_group, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @asset_note_groups = AssetNoteGroup.all
    respond_with(@asset_note_groups)
  end

  def show
    respond_with(@asset_note_group)
  end

  def new
    @asset_note_group = AssetNoteGroup.new
    respond_with(@asset_note_group)
  end

  def edit
  end

  def create
    @asset_note_group = AssetNoteGroup.new(asset_note_group_params)
    flash[:notice] = 'AssetNoteGroup was successfully created.' if @asset_note_group.save
    respond_with(@asset_note_group)
  end

  def update
    flash[:notice] = 'AssetNoteGroup was successfully updated.' if @asset_note_group.update(asset_note_group_params)
    respond_with(@asset_note_group)
  end

  def destroy
    @asset_note_group.destroy
    respond_with(@asset_note_group)
  end

  private
    def set_asset_note_group
      @asset_note_group = AssetNoteGroup.find(params[:id])
    end

    def asset_note_group_params
      params.require(:asset_note_group).permit(:GroupDescription, :GroupNoteText)
    end
end
