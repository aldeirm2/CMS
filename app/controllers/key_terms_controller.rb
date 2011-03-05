class KeyTermsController < ApplicationController
  # GET /key_terms
  # GET /key_terms.xml
  def index
    @key_terms = KeyTerm.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @key_terms }
    end
  end

  # GET /key_terms/1
  # GET /key_terms/1.xml
  def show
    @key_term = KeyTerm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @key_term }
    end
  end

  # GET /key_terms/new
  # GET /key_terms/new.xml
  def new
    @key_term = KeyTerm.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @key_term }
    end
  end

  # GET /key_terms/1/edit
  def edit
    @key_term = KeyTerm.find(params[:id])
  end

  # POST /key_terms
  # POST /key_terms.xml
  def create
    @key_term = KeyTerm.new(params[:key_term])

    respond_to do |format|
      if @key_term.save
        format.html { redirect_to(@key_term, :notice => 'Key term was successfully created.') }
        format.xml  { render :xml => @key_term, :status => :created, :location => @key_term }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @key_term.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /key_terms/1
  # PUT /key_terms/1.xml
  def update
    @key_term = KeyTerm.find(params[:id])

    respond_to do |format|
      if @key_term.update_attributes(params[:key_term])
        format.html { redirect_to(@key_term, :notice => 'Key term was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @key_term.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /key_terms/1
  # DELETE /key_terms/1.xml
  def destroy
    @key_term = KeyTerm.find(params[:id])
    @key_term.destroy

    respond_to do |format|
      format.html { redirect_to(key_terms_url) }
      format.xml  { head :ok }
    end
  end

end
