# Template for Middleman

This is a small bootstrap for quick web projects. This boilerplate includes;

- [Twitter Bootstrap][1] 3.1.1
- [Font Awesome][2] 4.1.0
- [jQuery][3] 1.11.0
- RetinaJS 0.0.2 (fixed by me)

## Usage

Clone this repo under `~/.middleman/`

    mkdir ~/.middleman # if you don't have
    cd ~/.middleman
    git clone https://github.com/webBoxio/middleman-boilerplate-template.git webbox

Than go to your working space for new middleman app and;

    cd ~/Desktop/
    middleman init my_new_website --template=webbox
    cd my_new_website/
    rm -rf .git/ readme.md # remove current git info
    git init               # crate your own git
    bundle install --path vendor/bundle # using Ruby 2.1.0
    rake # runs development server.

If you customize `config.rb` and uncomment `deploy` related parts
you can use:

    rake deploy

for building and deploying static site to remote server via **rsync**.










[1]: http://getbootstrap.com/
[2]: http://fontawesome.io
[3]: http://jquery.com/download/
