# lib/tasks/version_check.rb
require 'rails'
require 'rubygems'
require 'bundler'

class RailsUpgradeCompatibilityChecker
  def self.check_current_environment
    puts "🔍 Rails and Ruby Environment Compatibility Check\n"

    # Ruby Version Check
    ruby_version = RUBY_VERSION
    ruby_major = ruby_version.split('.')[0..1].join('.')
    rails_recommended_ruby = '3.1'

    puts "Current Environment Details:"
    puts "------------------------"
    puts "Ruby Version:  #{ruby_version}"

    # Rails Version Check
    begin
      rails_version = Rails.version
      puts "Rails Version: #{rails_version}"
    rescue NameError
      puts "❌ Rails not loaded. Ensure you're running this in a Rails environment."
      return
    end

    # Gem Dependency Version Checks
    begin
      puts "Bundler Version: #{Bundler::VERSION}"
    rescue => e
      puts "Bundler version could not be determined: #{e.message}"
    end

    # Ruby Compatibility Assessment
    ruby_compatibility_check(ruby_major, rails_recommended_ruby)

    # Rails Version Compatibility
    rails_version_compatibility_check(rails_version)

    # Gem Compatibility Quick Scan
    gem_compatibility_scan
  end

  def self.ruby_compatibility_check(ruby_major, rails_recommended_ruby)
    puts "\n📊 Ruby Compatibility:"
    begin
      if Gem::Version.new(ruby_major) < Gem::Version.new(rails_recommended_ruby)
        puts "⚠️ Warning: Consider upgrading Ruby."
        puts "   Current Version:     #{ruby_major}"
        puts "   Recommended Version: #{rails_recommended_ruby}+"
        puts "   Potential Issues: Some Rails 8 features may not be fully supported"
      else
        puts "✅ Ruby version is compatible with Rails 8"
      end
    rescue => e
      puts "❌ Error in Ruby compatibility check: #{e.message}"
    end
  end

  def self.rails_version_compatibility_check(rails_version)
    puts "\n📊 Rails Version Compatibility:"
    begin
      major_version = rails_version.split('.').first.to_i

      if major_version < 8
        puts "⚠️ Upgrade Recommended:"
        puts "   Current Version: #{rails_version}"
        puts "   Target Version:  8.x"
        puts "   Suggested Action: Plan incremental upgrade path"
      elsif major_version == 8
        puts "✅ Running Latest Rails Version (8.x)"
      else
        puts "🤔 Running Unreleased/Experimental Rails Version"
      end
    rescue => e
      puts "❌ Error in Rails version compatibility check: #{e.message}"
    end
  end

  def self.gem_compatibility_scan
    puts "\n📦 Quick Gem Compatibility Scan:"
    begin
      # Use Bundler CLI to check for outdated gems
      outdated_output = `bundle outdated 2>&1`

      # Check for actual outdated gems, filtering out platform warnings
      outdated_lines = outdated_output.lines.select do |line|
        line.include?('*') &&
        !line.include?('tzinfo-data') &&
        !line.include?('Fetching gem metadata')
      end

      if outdated_lines.empty?
        puts "✅ All gems appear to be up-to-date"

        # Platform-specific suggestion
        if outdated_output.include?('tzinfo-data')
          puts "\n📝 Note: You have platform-specific dependencies."
          puts "   Run `bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java`"
          puts "   to resolve platform-specific gem warnings"
        end
      else
        puts "⚠️ Potentially Outdated Gems Detected:"
        outdated_lines.each { |line| puts "   #{line.strip}" }
      end
    rescue => e
      puts "❌ Error scanning gem compatibility: #{e.message}"
      puts "   Raw output: #{outdated_output}"
    end
  end
end