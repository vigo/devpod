# -*- encoding: utf-8 -*-
require "bundler/setup"
require "stringex"
require "date"

task :default => ["preview"]

desc "Start preview / development server"
task :preview do
  system "middleman"
end

desc "Deploy"
task :deploy do
  system "middleman deploy"
end

desc "New podcast"
task :podcast, :episode_number, :episode_date do |t, args|
  args.with_defaults(:episode_number => "000")
  args.with_defaults(:episode_date => Time.now)
  # puts "#{Time.now.strftime('%a, %e %b %Y %H:%M:%S')}"
  t = args.episode_date
  t = DateTime.parse(args.episode_date) if args.episode_date.is_a?(String)
  filename = "source/#{t.strftime('%Y-%m-%d')}-#{args.episode_number.to_url}.html.markdown.erb"
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "title: \"title\""
    post.puts "date: \"#{t.strftime('%a, %e %b %Y %H:%M:%S')}\""
    post.puts "tags: "
    post.puts "length: \"1024\""
    post.puts "duration: \"01:01\""
    post.puts "type: \"audio/x-m4a\""
    post.puts "download: \"http://\""
    post.puts "---"
    post.puts "Kısa açıklama...READ_MORE"
    post.puts ""
    post.puts "### Bölüm Notları"
  end
end
