require 'stringex'
require 'time'
require 'sanitize'
require 'filesize'

activate :i18n

I18n.default_locale = :tr

Time.zone = "Europe/Istanbul"

activate :blog do |blog|
  blog.paginate = true
  blog.layout = "blog_layout"
  blog.summary_separator = /READ_MORE/
  blog.taglink = "etiket/{tag}.html"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
end

activate :directory_indexes
activate :livereload

set :css_dir, 'public/css'
set :js_dir, 'public/js'
set :images_dir, 'public/images'

set :markdown_engine, :redcarpet
set :markdown, :layout_engine => :erb, :autolink => true

configure :build do
  activate :minify_css
  activate :minify_javascript
end

page "/feed.xml", layout: false

# activate :deploy do |deploy|
#   deploy.build_before = true
#   deploy.method   = :rsync
#   deploy.user     = "SSH_USER"
#   deploy.host     = "SSH_HOST"
#   deploy.path     = "/path/to/foler/example.com"
# end
