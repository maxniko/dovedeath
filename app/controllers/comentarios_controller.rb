class ComentariosController < ApplicationController
  before_filter :authenticate_usuario!

  def create
    @post=Post.find(params[:post_id])
    #@comentario=@post.comentarios.create!(params[:comentario])
    #redirect_to @post

    @comentario= Comentario.new(params[:comentario])

    respond_to do |format|
      if @comentario.cuerpo == ""
          format.html { redirect_to(@post, :alert => 'No se pudo guardar porque no ha escrito nada que sea un comentario.') }
          format.xml  { head :ok }
      else
        @comentario=@post.comentarios.create!(params[:comentario])
        #redirect_to @post
        format.html { redirect_to(@post) }
        format.xml  { head :ok }
      end
    end


  end
  # GET /comentarios
  # GET /comentarios.xml
=begin  def index
    @comentarios = Comentario.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comentarios }
    end
  end

  # GET /comentarios/1
  # GET /comentarios/1.xml
  def show
    @comentario = Comentario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comentario }
    end
  end

  # GET /comentarios/new
  # GET /comentarios/new.xml
  def new
    @comentario = Comentario.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comentario }
    end
  end

  # GET /comentarios/1/edit
  def edit
    @comentario = Comentario.find(params[:id])
  end

  # POST /comentarios
  # POST /comentarios.xml
  def create
    @comentario = Comentario.new(params[:comentario])

    respond_to do |format|
      if @comentario.save
        format.html { redirect_to(@comentario, :notice => 'Comentario was successfully created.') }
        format.xml  { render :xml => @comentario, :status => :created, :location => @comentario }
      elsecomentarios/1
        format.html { render :action => "new" }
        format.xml  { render :xml => @comentario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comentarios/1
  # PUT /comentarios/1.xml
  def update
    @comentario = Comentario.find(params[:id])

    respond_to do |format|
      if @comentario.update_attributes(params[:comentario])
        format.html { redirect_to(@comentario, :notice => 'Comentario was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comentario.errors, :status => :unprocessable_entity }
      end
    end
  end
=end
  # DELETE /comentarios/1
  # DELETE /comentarios/1.xml
  def destroy
    @comentario = Comentario.find(params[:id])
    as = @comentario.post_id
    @comentario.destroy
    @post = Post.find(as)
    respond_to do |format|
      format.html { redirect_to (@post) }
      format.xml  { head :ok }
    end
  end

end

