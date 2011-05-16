class CategoriaController < ApplicationController
  before_filter :menu_principal_seleccion

  # GET /categoria
  # GET /categoria.xml
  def index
    @categoria = Categorium.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categoria }
    end
  end

  # GET /categoria/1
  # GET /categoria/1.xml
  def show
    @categorium = Categorium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @categorium }
    end
  end

  # GET /categoria/new
  # GET /categoria/new.xml
  def new
    @categorium = Categorium.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @categorium }
    end
  end

  # GET /categoria/1/edit
  def edit
    @categorium = Categorium.find(params[:id])
  end

  # POST /categoria
  # POST /categoria.xml
  def create
    @categorium = Categorium.new(params[:categorium])

    respond_to do |format|
      if @categorium.save
        format.html { redirect_to(@categorium, :notice => 'Categorium was successfully created.') }
        format.xml  { render :xml => @categorium, :status => :created, :location => @categorium }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @categorium.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categoria/1
  # PUT /categoria/1.xml
  def update
    @categorium = Categorium.find(params[:id])

    respond_to do |format|
      if @categorium.update_attributes(params[:categorium])
        format.html { redirect_to(@categorium, :notice => 'Categorium was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @categorium.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categoria/1
  # DELETE /categoria/1.xml
  def destroy
    @categorium = Categorium.find(params[:id])
    @categorium.destroy

    respond_to do |format|
      format.html { redirect_to(categoria_url) }
      format.xml  { head :ok }
    end
  end

 def menu_principal_seleccion
   session[:seleccion] = 1
 end
end

