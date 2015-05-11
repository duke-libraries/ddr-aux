require "delegate"
require 'pragmatic_context'

module Api
  class Context < SimpleDelegator
    include PragmaticContext::Contextualizable
  end
end
