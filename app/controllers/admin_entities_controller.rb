class AdminEntitiesController < ApplicationController

  respond_to :json

  def index
    respond_with AdminEntity.all
  end

  def slug
    respond_with AdminEntity.find_by(slug: params.require(:slug))
  end

end
