require 'stringex'
require 'time'
require 'sanitize'
require 'filesize'
require './creds'

activate :i18n

I18n.default_locale = :tr

Time.zone = "Europe/Istanbul"

activate :blog do |blog|
  blog.sources = "posts/{year}-{month}-{day}-{title}.html"
  blog.paginate = true
  blog.layout = "blog_layout"
  blog.summary_separator = /READ_MORE/
  blog.taglink = "etiket/{tag}.html"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
  blog.page_link = "sayfa/{num}"
  # blog.year_link = ""
end

activate :directory_indexes
activate :livereload

set :css_dir, 'public/css'
set :js_dir, 'public/js'
set :images_dir, 'public/images'
set :canonical_url, 'http://devpod.org'
set :markdown_engine, :redcarpet
set :markdown, :layout_engine => :erb, :autolink => true
set :podcast_prefix, "http://www.podtrac.com/pts/redirect.mp3/"

configure :build do
  activate :minify_css
  activate :minify_javascript
end

page "/feed.xml", layout: false

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method   = :rsync
  deploy.user     = SSH_USER
  deploy.host     = SSH_HOST
  deploy.path     = SSH_PATH
end
