helpers do
  def nav_link(link_text, page_url, options = {})
    options[:class] ||= ""
    if current_page.url.length > 1
      current_url = current_page.url.chop
    else
      current_url = current_page.url
    end
    content_tag :li, :class => current_url.start_with?(page_url) ? "active" : ""  do
      link_to(link_text, page_url, options)
    end
  end
end

set :relative_links, true
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :fonts_dir, 'fonts'
set :layout, 'layouts/application'

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page '/error.html', directory_index: false

activate :sprockets
activate :autoprefixer
activate :directory_indexes
activate :syntax, :line_numbers => true
activate :blog do |blog|
  blog.prefix = "articles"
  blog.permalink = "{year}/{month}/{day}/{title}.html"
  blog.sources = "{year}-{month}-{day}-{title}.html"
  blog.taglink = "tags/{tag}.html"
  blog.layout = "article"
  blog.summary_separator = /(READMORE)/
  blog.summary_length = 250
  blog.year_link = "{year}.html"
  blog.month_link = "{year}/{month}.html"
  blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".markdown"
  blog.tag_template = "articles/tag.html"
  blog.calendar_template = "articles/calendar.html"
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/{num}"
end

configure :development do
  set :debug_assets, true
  activate :livereload
end

configure :build do
  activate :minify_html
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
end

activate :s3_sync do |s3_sync|
  s3_sync.region = ENV['AWS_REGION']
  s3_sync.bucket = ENV['AWS_BUCKET']
  s3_sync.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
  s3_sync.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
end

default_caching_policy max_age:(60 * 60 * 24 * 365)
caching_policy 'text/html', max_age: 0, must_revalidate: true
