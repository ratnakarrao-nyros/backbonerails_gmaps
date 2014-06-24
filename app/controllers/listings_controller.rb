class ListingsController < ApplicationController
  # GET /listings
  # GET /listings.json
  def index
    #@listings = Listing.all

    @listings = Listing.paginate(:page => params[:page], :per_page => 3).order("#{params[:sort]} #{params[:order]} ")
    
    #@pagination = {total_entries: @listings.count, total_pages: @listings.current_page, per_page: 2}
    #@listings = [{per_page: 15, total_entries: 241, total_pages: 17, page: 1},[{name: "Afghanistan",:id => 1},{name: "Afghanistan",:id => 2},{name: "Afghanistan",:id => 3},{name: "Afghanistan",:id => 4},{name: "Afghanistan",:id => 5},{name: "Afghanistan",:id => 6},{name: "Afghanistan",:id => 7},{name: "Afghanistan",:id => 8},{name: "Afghanistan",:id => 9}]]
    #binding.pry 

    # def index
    # qrcodes_paginated = Qrcode.order('id').page(params[:page]).per(PER_PAGE_RECORDS)

    # respond_to do |format|
    #   format.json { render :json => {:models => qrcodes_paginated, :current_page => params[:page].to_i, :perPage => PER_PAGE_RECORDS, :total_pages => qrcodes_paginated.num_pages } }
    # end



    @hash = Gmaps4rails.build_markers(@listings) do |listing, marker|
      marker.lat listing.latitude
      marker.lng listing.longitude
    end

    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: {listings: @listings,:current_page => params[:page].to_i, 
                                 :perPage => 3, :total_pages => @listings.total_entries, hash: @hash }} 
    end
  end


   # per_page = params[:per_page].to_i || 15
   # @articles = Article.scoped.page(params[:page]).per_page(@per_page)
   # @pagination = { total: @articles.count, page: @articles.current_page, per_page: @per_page}

   # respond_to do |format|
   #   format.html
   #   format.json { render json: {articles: @articles, pagination: @pagination}}
   # end



  # GET /listings/1
  # GET /listings/1.json
  def show
    @listing = Listing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @listing }
    end
  end

  # GET /listings/new
  # GET /listings/new.json
  def new
    @listing = Listing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @listing }
    end
  end

  # GET /listings/1/edit
  def edit
    @listing = Listing.find(params[:id])
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(params[:listing])

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render json: @listing, status: :created, location: @listing }
      else
        format.html { render action: "new" }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /listings/1
  # PUT /listings/1.json
  def update
    @listing = Listing.find(params[:id])

    respond_to do |format|
      if @listing.update_attributes(params[:listing])
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @listing.errors.messages, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to listings_url }
      format.json { head :no_content }
    end
  end
end
