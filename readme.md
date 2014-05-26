# devPod

Türkçe developer podcast resmii websitesi!

# Kurulum

Öncelikle `ruby 2.1.0` kurulu olmalı (`rvm` ya da `rbenv`)

    bundle install --path vendor/bundle
    bundle exec middleman

Deployment için root dizininde; `creds.rb` dosyasını oluşturun.

    SSH_USER = "kullancı adı"
    SSH_HOST = "sunucu"
    SSH_PATH = "/path/to/devpod.org"

gibi statik sayfaları sunacağınız web sunucusu ile ilgili bilgileri girin.

[http://devpod.org](http://devpod.org)
