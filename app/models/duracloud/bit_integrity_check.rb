module Duracloud
  class BitIntegrityCheck < ActiveRecord::Base
    include Report

    self.table_name = "duracloud_bit_integrity_checks"
    self.report_type = "Duracloud::BitIntegrityReport"
  end
end