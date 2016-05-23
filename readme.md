# devPod

Türkçe developer podcast resmii websitesi!

## Kurulum

Öncelikle `ruby 2.2.2` kurulu olmalı (`rvm` ya da `rbenv`)

    bundle install --path vendor/bundle
    bundle exec middleman
    bundle exec rake -T
    
    rake deploy                                # Deploy
    rake podcast[episode_number,episode_date]  # New podcast
    rake preview                               # Start preview / development server

## Deployment

GitHub Pages kullanılıyor.

[http://devpod.org](http://devpod.org)

## Lisans

Bu proje MIT lisansı kullanmaktadır.