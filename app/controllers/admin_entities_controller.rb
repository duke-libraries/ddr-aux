class AdminEntitiesController < ApplicationController

  def index
    @admin_entities = AdminEntity.all
    respond_to do |format|
      format.json { render json: @admin_entities }
    end
  end

  def show
    @admin_entity =
      if params[:id].to_i == 0
        AdminEntity.find_by(slug: params[:id])
      else
        AdminEntity.find(params[:id])
      end
    respond_to do |format|
      format.json { render json: @admin_entity }
    end
  end

  def slugs
    @slugs = AdminEntity.pluck(:slug, :name).to_h
    respond_to do |format|
      format.json { render json: @slugs }
    end
  end

end
