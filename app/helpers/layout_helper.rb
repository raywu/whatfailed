module LayoutHelper
  def title(page_title)
    content_for(:title) { raw ("<h1>#{page_title.to_s}</h1>") }
  end

  def show_title?
    @show_title
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
end