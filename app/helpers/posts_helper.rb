module PostsHelper
  
  def title(post)
    if post.url.blank?
		 link_to post.title, post
		  else
		 link_to post.title, post.url
		end
	end
end
