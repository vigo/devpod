
install:
	bundle install --path vendor/bundle
	bundle exec middleman 
	bundle exec rake -T
