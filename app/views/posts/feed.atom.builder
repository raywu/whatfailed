atom_feed :language => 'en-US' do |feed|
  feed.title "Whatfailed.us"
  feed.updated @articles.first.accepted
              
  @posts.each do |post|
    feed.entry post, :published => post.accepted do |entry|
      entry.title post.title
      # entry.summary post.teaser + '<br /><br />Read the full article: <a href="' + post_url(post) + '">' + post_url(post) + '</a><br /><br />', :type => 'html'
      
      # entry.author do |author|
      #   author.name article.user.fullname
      # end
    end
  end
end
