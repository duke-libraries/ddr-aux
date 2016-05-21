namespace :duracloud do
  namespace :update_report do
    desc "Update the Audit Log entries for a DuraCloud space"
    task :audit, [:space_id] => :environment do |t, args|
      puts "Updating Duracloud audit log for space '#{args[:space_id]}' ..."
      Duracloud::AuditLogEntry.update_report(args[:space_id])
      puts "Duracloud audit log updated."
    end

    desc "Update the Bit Integrity Report for a DuraCloud space"
    task :bit_integrity, [:space_id] => :environment do |t, args|
      puts "Updating Duracloud bit integrity report for space '#{args[:space_id]}' ..."
      Duracloud::BitIntegrityCheck.update_report(args[:space_id])
      puts "Duracloud bit integrity report updated."
    end

    desc "Update the Manifest entries for a DuraCloud space"
    task :manifest, [:space_id] => :environment do |t, args|
      puts "Updating Duracloud manifest for space '#{args[:space_id]}' ..."
      Duracloud::ManifestEntry.update_report(args[:space_id])
      puts "Duracloud manifest updated."
    end

    desc "Update all reports for a DuraCloud space"
    task :all, [:space_id] => :environment do |t, args|
      [:manifest, :audit, :bit_integrity].each do |rep|
        Rake::Task["duracloud:update_report:#{rep}"].invoke(args[:space_id])
      end
    end
  end
end
