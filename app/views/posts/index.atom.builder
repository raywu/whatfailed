atom_feed do |feed|
    feed.title("WhatFailed.us")
    feed.updated(@posts.first.created_at)

    @posts.each do |post|
      feed.entry(post) do |entry|
        entry.title(post.title)
      end
    end
  end
