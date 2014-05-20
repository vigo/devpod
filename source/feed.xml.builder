general_site_url = "http://devpod.org/"
general_author = "2012 Uğur \"vigo\" Özyılmazel"
general_author_email = "ugurozyilmazel@gmail.com"
general_subtitle = "Yazılım geliştiricisi olmak, hayata bu şekilde bakmak..."
general_summary = "Yazım geliştiricisi misiniz? e birde Mac kullanıyorsanız? Haydi ne duruyorsunuz? İşte TÜRKÇE podcast!"
general_description = "Developer’lar için Türkçe podcast. Python’dan C#’a, Ruby’den 6502 Assembly’e kadar her türlü programlama dili, tabiiki iOS / MacOS ve tabiiki Demoscene [ commodore + amiga ]"
general_keywords = "vigo,amiga,commodore,development,yazılım,yazilim,software,python,ruby,php,django,rails,apple,mac,ipad,iphone,ios,applescript,shell,bash,textmate,6502,68000,bronx,demoscene,zombieboys"

xml.instruct!
xml.rss "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd", :version => "2.0" do
  xml.channel do
    xml.atom :link, "xmlns:atom" => "http://www.w3.org/2005/Atom", :rel => "self", :type => "application/rss+xml", :href => "http://devpod.org/feed.xml"
        xml.title "devPod"
        xml.link general_site_url
        xml.language "tr-tr"
        xml.copyright general_author
        xml.itunes :subtitle, general_subtitle
        xml.itunes :author, general_author
        xml.itunes :summary, general_summary
        xml.itunes :description, general_description
        xml.itunes :owner do
          xml.itunes :name, general_author
          xml.itunes :email, general_author_email
        end
        xml.itunes :image, :href => "#{general_site_url}public/images/devpod-logo-1400x1400.png"
        xml.itunes :category, :text => "Technology" do
          xml.itunes :category, :text => "Podcasting"
        end
        xml.itunes :category, :text => "Technology" do
          xml.itunes :category, :text => "Software How-To"
        end
        xml.itunes :category, :text => "Technology" do
          xml.itunes :category, :text => "Tech News"
        end
        xml.itunes :explicit, "no"
        xml.itunes :keywords, general_keywords

        blog.articles.each do |article|
          clean_description = Sanitize.clean(article.summary).strip
          xml.item do
            xml.title article.title
            xml.pubDate article.date.to_time.rfc2822
            xml.description clean_description
            xml.itunes :summary, clean_description
            xml.itunes :subtitle, clean_description
            xml.enclosure :url => article.metadata[:page]['download'], :length => article.metadata[:page]['length'], :type => article.metadata[:page]['type']
            xml.guid URI.join(general_site_url, article.url), :isPermaLink => "false"
            xml.itunes :duration, article.metadata[:page]['duration']
            xml.itunes :keywords, article.tags.join(",")
          end
        end
  end
end
