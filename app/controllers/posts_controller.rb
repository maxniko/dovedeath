class PostsController < ApplicationController
  include Faker
   before_filter :menu_principal_seleccion

  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.find(:all,:order => 'created_at DESC').paginate(:per_page => 5, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])
    @comentario = Comentario.new
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => [@post, @comentario] }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new
    @categoria = Categorium.find(:all, :order => 'nombre ASC').collect {|m| [m.nombre, m.id]}

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => [@post, @categoria] }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
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
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end

  def ipsum
    @post = Post.new
    @post.titulo = Lorem.sentence
    @post.cuerpo = Lorem.paragraphs
    @categoria = Categorium.find(:all, :order => 'nombre ASC').collect {|m| [m.nombre, m.id]}
    @categorias = Categorium.find(:all, :order => 'nombre ASC')
    @categorium = @categorias[rand(@categorias.size)]
    @post.categorium = @categorium

    respond_to do |format|
      format.html { render :action => "new" }# ipsum.html.erb
      format.xml  { render :xml => [@post, @categoria] }
    end
  end


  def menu_principal_seleccion
    session[:seleccion] = 0
  end
end

