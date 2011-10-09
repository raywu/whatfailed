class TagsController < ApplicationController
  before_filter :authed, :except => [:index, :show]
  
  def index
    @tags = Tag.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @tags }
      format.json {
        @tags = Tag.where("name like ?", "%#{params[:q]}%").select(['name', 'id'])
        render :json => @tags.map(&:attributes)
      }
    end
  end

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts
    @posts = @posts.paginate :page => params[:page], :per_page => 10, :order => 'created_at DESC'

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tag }
      format.json { render :json => @tags.map(&:attributes) }
    end
  end
end
