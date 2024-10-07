namespace :dj do
  desc "Rake task for updating expired column to true if job listings are older than 60 days from today!"
  task :expire_listings_older_than_60_days_from_today do
    puts "Task expire_listings_older_than_60_days_from_today starts"
    Listing.where("paid = ? and created_at < ? and expired = ?", true, Date.today - 60.days, false).each do |listing|
      listing.expired = true
      if listing.save
        # run mailer here
      end
    end
  end
end
