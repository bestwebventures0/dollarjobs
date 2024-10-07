xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Dollar Jobs"
    xml.description "World's magical beast of Business Development, Sales, Digital Marketing etc job board with thousands of unique users and hundreds of new positions posted each month!"
    xml.link root_url

    if @category
      xml.category do
        xml.title @category.title
        @category.listings.where("paid = ? and created_at >= ?", true, Date.today - 60.days).order(created_at: :desc).each do |listing|
          xml.listing do
            xml.title listing.title
            xml.description listing.description
            xml.company_name listing.company_name
            xml.industry listing.industry
            xml.pubDate listing.created_at.to_s(:rfc822)
            xml.link listing_url(listing)
            xml.guid listing_url(listing)
          end
        end
      end

    elsif @company_name
      xml.company do
        xml.title @company_name
        Listing.where("paid = ? and created_at >= ? and company_name = ?", true, Date.today - 60.days, @company_name).order(created_at: :desc).each do |listing|
          xml.listing do
            xml.title listing.title
            xml.description listing.description
            xml.category listing.category.title
            xml.industry listing.industry
            xml.pubDate listing.created_at.to_s(:rfc822)
            xml.link listing_url(listing)
            xml.guid listing_url(listing)
          end
        end
      end

    elsif @industry
      xml.industry do
        xml.title @industry
        Listing.where("paid = ? and created_at >= ? and industry = ?", true, Date.today - 60.days, @industry).order(created_at: :desc).each do |listing|
          xml.listing do
            xml.title listing.title
            xml.description listing.description
            xml.company_name listing.company_name
            xml.category listing.category.title
            xml.pubDate listing.created_at.to_s(:rfc822)
            xml.link listing_url(listing)
            xml.guid listing_url(listing)
          end
        end
      end

    else
      @categories.each do |category|
        xml.category do
          xml.title category.title
          category.listings.where("paid = ? and created_at >= ?", true, Date.today - 60.days).each do |listing|
            xml.listing do
              xml.title listing.title
              xml.description listing.description
              xml.company_name listing.company_name
              xml.industry listing.industry
              xml.pubDate listing.created_at.to_s(:rfc822)
              xml.link listing_url(listing)
              xml.guid listing_url(listing)
            end
          end
        end
      end

    end

  end
end
