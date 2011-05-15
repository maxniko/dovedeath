class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml
  def index
    menu_principal_seleccion
    @posts = Post.find(:all).paginate :page => params[:page], :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    menu_principal_seleccion
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    menu_principal_seleccion
    @post = Post.new
    @categoria = Categorium.find(:all, :order => 'nombre ASC').collect {|m| [m.nombre, m.id]}

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => [@post, @categoria] }
    end
  end

  # GET /posts/1/edit
  def edit
    menu_principal_seleccion
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    menu_principal_seleccion
    @post = Post.new(params[:post])
    @categoria = Categorium.find(:all, :order => 'nombre ASC').collect {|m| [m.nombre, m.id]}

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => [@post, @categoria], :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => [@post.errors, @categoria], :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    menu_principal_seleccion
    @post = Post.find(params[:id])
    @categoria = Categorium.find(:all, :order => 'nombre ASC').collect {|m| [m.nombre, m.id]}

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to([@post, @categoria], :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => [@post.errors, @categoria], :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    menu_principal_seleccion
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
  def menu_principal_seleccion
    session[:seleccion] = 0
  end
end

