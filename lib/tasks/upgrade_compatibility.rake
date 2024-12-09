# lib/tasks/upgrade_compatibility.rake
namespace :upgrade do
  desc "Quick Rails upgrade compatibility check"
  task check_compatibility: :environment do
    puts "🚀 Rails Upgrade Compatibility Diagnostic\n"

    # Gem Compatibility Check (Faster method)
    puts "\n📦 Gem Compatibility Scan:"
    system('bundle outdated --no-color')

    # Lightweight Security Scan
    puts "\n🔒 Security Vulnerability Scan:"
    system('brakeman -q -z')

    # Minimal Upgrade Readiness Assessment
    puts "\n📊 Upgrade Readiness:"
    current_rails_version = Rails.version
    newest_rails_version = `gem list rails | grep rails`.split.last.gsub(/[()]/, '')

    puts "Current Rails Version: #{current_rails_version}"
    puts "Latest Rails Version:  #{newest_rails_version}"

    if current_rails_version.split('.').first.to_i < 7
      puts "⚠️  Upgrade Recommended: Consider moving to Rails 7+"
    else
      puts "✅ Rails Version is Recent"
    end
  end
end