class AdminEntitiesController < ApplicationController

  def show
    @admin_entity = AdminEntity.find_by(slug: params.require(:slug))
    respond_to do |format|
      format.json { render json: @admin_entity }
    end
  end

end
