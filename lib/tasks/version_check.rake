# lib/tasks/version_check.rake
require_relative 'version_check'  # Explicitly require the file

namespace :app do
  desc "Check Rails and Ruby environment compatibility"
  task version_check: :environment do
    RailsUpgradeCompatibilityChecker.check_current_environment
  end
end