module PostsHelper
  
# todo: Check for http, if not include it  

  def header(post)
    if post.url.blank?
      link_to post.title, post
    else
      link_to post.title, post.url
		end
	end
	
	def link(post)
	    if post.url?
	      "(#{URI.parse(post.url).host})"
	    end
	end
end
