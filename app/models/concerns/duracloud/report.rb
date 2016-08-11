require "duracloud"

module Duracloud
  module Report

    def self.extended(base)
      base.class_eval do
        scope :content, ->(content_id) { where(["content_id LIKE ?", "%#{content_id}%"]) }
        class_attribute :report_type
      end
    end

    def default_space_id
      ENV["DURACLOUD_SPACE"]
    end

    def update_report(space_id, store_id = nil)
      clear_existing_records(space_id, store_id)
      report = get_report(space_id, store_id)
      if connection.adapter_name.downcase == "mysql2"
        mysql_update_report(report)
      else
        report.rows.each { |row| create(row) }
      end
    end

    def get_report(space_id, store_id = nil)
      report_type.constantize.new(space_id, store_id)
    end

    def clear_existing_records(space_id, store_id = nil)
      conditions = { space_id: space_id }
      conditions[:store_id] = store_id if store_id
      where(conditions).delete_all
    end

    def mysql_update_report(report)
      download_report_file(report) do |path|
        # Assume columns are defined in same order as report fields (R-L)
        cols = ( column_names - ["id"] ).join(", ")
        sql = "LOAD DATA LOCAL INFILE '#{path}' INTO TABLE #{table_name} IGNORE 1 LINES (#{cols})"
        connection.execute(sql)
      end
    end

    def download_report_file(report)
      require "tempfile"
      Tempfile.open("report", "wb") do |temp|
        temp.write(report.tsv)
        temp.close
        yield temp.path
      end
    end
  end
end
