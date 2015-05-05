require 'ddr_aux'
require "forwardable"

class Ability
  extend Forwardable

  include CanCan::Ability

  class << self
    attr_accessor :permissions
  end

  self.permissions = []

  attr_reader :user_context
  def_delegators :user_context, :user, :request

  def initialize(user_context)
    @user_context = user_context
    apply_permissions
  end

  private

  def apply_permissions
    self.class.permissions.each do |perms|
      klass = perms.is_a?(Class) ? perms : perms.constantize
      klass.new(self).apply
    end
  end

end
