require "delegate"

module DdrAux
  #
  # Delegates to an authorization class (e.g., Ability)
  # which applies the permissions by calling the `apply'
  # instance method.
  #
  class Permissions < SimpleDelegator

    def apply
      raise NotImplementedError, "Subclasses must implement `apply'."
    end

  end
end
