module CustomHelpers
  def has_video(article)
    " + #{icon("video-camera")}" if article.metadata[:page].has_key?("youtube")
  end
  
  def podtrack_url(url)
    url = "#{storage_url}#{url}"
    "#{podcast_prefix}#{url.sub(/https?:\/\//, "")}"
  end
  
  def icon(icon_name, size="")
    size = " fa-#{size}" if size
    "<i class=\"fa fa-#{icon_name}#{size}\"></i>"
  end


  def custom_pager(**options)
    output = []
    if options[:paginate] && options[:num_pages] > 1
      output << '<ul class="pagination">'

      if options[:prev_page]
        li_class = "previous"
        a_link = link_to "&larr;", options[:prev_page], :target => "_self"
      else
        li_class = "previous disabled"
        a_link = link_to "&larr;", ""
      end
      output << "<li class=\"#{li_class}\">#{a_link}</li>"

      (1..options[:num_pages]).each do |n|
        li_class = ""
        li_class = "active" if n == options[:current_page]
        a_link = options[:url_home]
        a_link = options[:url_schema] % n if n > 1

        output << "<li class=\"#{li_class}\">#{link_to n, a_link, :target => '_self'}</li>"
      end

      if options[:next_page]
        li_class = "next"
        a_link = link_to "&rarr;", options[:next_page], :target => "_self"
      else
        li_class = "next disabled"
        a_link = link_to "&rarr;", ""
      end
      output << "<li class=\"#{li_class}\">#{a_link}</li>"

      output << '</ul>'
    end
    output.join("\n")
  end
end
