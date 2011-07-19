class TagsController < ApplicationController
  
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
    @posts = @posts.paginate :page => params[:page], :per_page => 4, :order => 'created_at DESC'

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tag }
      format.json { render :json => @tags.map(&:attributes) }
    end
  end

  def new
    @tag = Tag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tag }
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(params[:tag])

    respond_to do |format|
      if @tag.save
        format.html { redirect_to(@tag, :notice => 'Tag was successfully created.') }
        format.xml  { render :xml => @tag, :status => :created, :location => @tag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @tag = Tag.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.html { redirect_to(@tag, :notice => 'Tag was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to(tags_url) }
      format.xml  { head :ok }
    end
  end
end
