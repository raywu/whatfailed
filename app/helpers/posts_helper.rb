module PostsHelper
  
# todo: Check for http, if not include it  

  def header(post)
    # if post.url.blank?
      link_to post.title, post
    # else
    #   link_to post.title, post.url, html_options = { :target => "_blank" }
		# end
	end
	
	def link(post)
	    if post.url?
	      link_to "(#{URI.parse(post.url).host})", post.url, html_options = { :target => "_blank" }
	    end
	end
end
