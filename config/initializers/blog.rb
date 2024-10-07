#config/initializers/blog.rb

if Rails.env == 'production'
  ENV["JEKYLL_ENV"] = "production"
else
  ENV["JEKYLL_ENV"] = "development"
end

Rails.application.config.after_initialize do
  dest = Rails.root.join('public/blog')
  # generate the site
  Jekyll::Site.new(
    Jekyll.configuration({
      "config" => Rails.root.join('config', 'jekyll.yml').to_s,
      "source" => Rails.root.join('blog').to_s,
      "destination" => dest.to_s
    })
  ).process
end
