require "duracloud"

module Duracloud
  module Report

    def self.extended(base)
      class << base
        attr_accessor :report_type
      end
    end

    def default_space_id
      ENV["DURACLOUD_SPACE"]
    end

    def update_report(space_id:, store_id: nil, path: nil)
      report = report_type.constantize.new(space_id, store_id)
      report.load_tsv_file(path) if path
      clear_existing_records(report)
      report.rows.each { |row| create(row) }
      true
    end

    private

    def clear_existing_records(report)
      records = where(space_id: report.space_id)
      if report.store_id
        records.where(store_id: report.store_id)
      end
      records.delete_all
    end

  end
end
