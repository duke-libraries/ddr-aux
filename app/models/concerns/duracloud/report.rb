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

    # @example
    #
    # Object URI:
    # (unencoded info:fedora/duke:1)
    # info%3Afedora%2Fduke%3A1
    #
    # SQL query:
    # content_id LIKE '%/info\%3Afedora\%2Fduke\%3A1' OR content_id LIKE '%/info\%3Afedora\%2Fduke\%3A1\%2F%'
    #
    def fcrepo3(object_uri)
      sql = if sqlite?
              "content_id LIKE ? ESCAPE '\\' OR content_id LIKE ? ESCAPE '\\'"
            else
              "content_id LIKE ? OR content_id LIKE ?"
            end
      content_id = URI.encode_www_form_component(object_uri).gsub(/%/, "\\%")
      where(sql, "%/#{content_id}", "%/#{content_id}\\%2F%")
    end

    def update_report(space_id, store_id = nil)
      clear_existing_records(space_id, store_id)
      report = get_report(space_id, store_id)
      if mysql?
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
      Tempfile.open("report") do |temp|
        temp.write(report.tsv)
        temp.close
        yield temp.path
      end
    end

    private

    def mysql?
      connection.adapter_name.downcase == "mysql2"
    end

    def sqlite?
      connection.adapter_name.downcase == "sqlite"
    end
  end
end
