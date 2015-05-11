module Api
  class AdminEntitiesController < ModelController

    self.find_by_attribute = :slug
    self.context = AdminEntityContext

  end
end
