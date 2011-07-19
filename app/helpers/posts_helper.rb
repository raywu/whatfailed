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
	
	def relative_time(posttime)
    diff_seconds = Time.now - posttime
    case diff_seconds
      when 0 .. 59
        "#{(diff_seconds).to_i} seconds ago"
      when 60 .. (3600-1)
        "#{(diff_seconds/60).to_i} minutes ago"
      when 3600 .. (3600*24-1)
        "#{(diff_seconds/360).to_i} hours ago"
      when (3600*24) .. (3600*24*30) 
        "#{(diff_seconds/(3600*24)).to_i} days ago"
      else
        posttime.strftime("%m/%d/%Y")
    end
  end
end
