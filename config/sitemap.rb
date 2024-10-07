# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.dollarjobs.co"
SitemapGenerator::Sitemap.create_index = :auto

SitemapGenerator::Sitemap.create do

  Listing.where(paid: true).find_each do |listing|
    add listing_path(listing), :lastmod => listing.updated_at
  end

  add '/about'
  add '/contact'
  add '/terms'
  add '/privacy'
  add '/blog'

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
