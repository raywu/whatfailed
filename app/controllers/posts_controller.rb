class PostsController < ApplicationController
  before_filter :authed, :except => [:index, :show]
  
  def index
    @posts = Post.all
    @posts = Post.paginate :page => params[:page], :order => 'created_at DESC'
    
    respond_to do |format|
      format.html #index.html.erb
      format.xml  { render :xml => @posts }
      format.atom
    end
  end

  def show
    @post = Post.find(params[:id])
    @votes = @post.votes

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.create(params[:post])
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
  
  def vote_for
    begin
      if current_user.nil?
         flash[:error] = "Please login first!"
      else
        if current_user.voted_for?(@post = Post.find(params[:id]))
          flash[:notice] = "You already voted up"
        else
          @vote_for = current_user.vote_exclusively_for(@post = Post.find(params[:id]))
          @vote_for.save!
        end
        redirect_to :back
       end
      rescue ActiveRecord::RecordInvalid
      render :nothing => true, :status => 404
    end
  end

  def vote_against
    begin
      if current_user.nil?
         flash[:error] = "Please login first!"
      else
        if current_user.voted_against?(@post = Post.find(params[:id]))
          flash[:notice] = "You already voted down"
        else
          @vote_for = current_user.vote_exclusively_against(@post = Post.find(params[:id]))
          @vote_for.save!
        end
        redirect_to :back
       end
      rescue ActiveRecord::RecordInvalid
      render :nothing => true, :status => 404
    end
  end

  def login
    # respond_to do |format|
    #   format.html #login.html.erb
    # end
  end
end
