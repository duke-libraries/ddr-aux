require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

def get_version
  File.read(File.expand_path('../VERSION', __FILE__)).strip
end

desc "Print the version string of the app"
task :version do
  puts get_version
end

desc "Tag version v#{get_version}"
task :tag do
  require 'open3'
  v = get_version
  puts "Tagging version v#{v} ..."
  stdout, stderr, status = Open3.capture3("git tag -a v#{v} -m \"ddr-aux v#{v}\"")
  if status.success?
    puts stdout unless stdout.blank?
    puts "Pushing tag v#{v} to origin ..."
    `git push origin v#{v}`
  else
    puts "ERROR: #{stderr}"
  end
end

desc "Create admin user"
task :create_admin => :environment do
  if User.exists?(username: "admin")
    puts "User 'admin' already exists."
  else
    password = Devise.friendly_token
    User.create!(username: "admin", admin: true, password: password)
    puts "Created user 'admin' with password '#{password}'."
  end
end

namespace :api do
  desc "Generate an API key for a user"
  task :generate_key, [:username] => :environment do |t, args|
    user = User.find_by_username!(args[:username])
    if user.api_key
      puts "User #{user} already has API key: #{user.api_key}"
    else
      user.generate_api_key!
      puts "API key for #{user}: #{user.api_key}"
    end
  end
end

namespace :test do
  desc "Run API integration tests"
  task :integration => :environment do
    system "rails server -e test -d"
    system "rspec ./test/integration/"
    pid = `cat tmp/pids/server.pid`
    system "kill -QUIT #{pid}"
  end
end
