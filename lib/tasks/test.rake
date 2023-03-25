# lib/tasks/test.rake
namespace :test do
  desc "Run system tests with driver (options: with[chrome], with[firefox], with[headless_chrome])"
  namespace :system do
    task :with, [:driver] => :environment do |task, args|
      ENV["DRIVER"] = args[:driver]
      Rake::Task["test:system"].invoke
    end
  end
end
