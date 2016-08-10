require "duracloud-client"

module Duracloud
  module Report
    extend ActiveSupport::Concern

    included do
      scope :content, ->(content_id) { where(["content_id LIKE ?", "%#{content_id}%"]) }
      class_attribute :report_type

      def self.update_report(space_id, store_id = nil)
        clear_existing_records(space_id, store_id)
        report = get_report(space_id, store_id)
        report.rows.each { |row| create(row) }
      end

      def self.get_report(space_id, store_id = nil)
        report_type.constantize.new(space_id, store_id)
      end

      def self.clear_existing_records(space_id, store_id = nil)
        conditions = { space_id: space_id }
        conditions[:store_id] = store_id if store_id
        where(conditions).delete_all
      end
    end
  end
end
