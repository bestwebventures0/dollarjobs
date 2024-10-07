class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :preview]
  before_action :set_price, only: [:index, :new, :create, :edit, :update, :preview]
  before_action :cant_perform_when_listing_is_paid, only: [:edit, :update, :preview]
  before_action :cant_perform_when_listing_is_unpaid, only: [:show]

  # GET /listings
  # GET /listings.json
  def index
    @categories_for_punchline = Category.all.order(title: :asc)
    @categories = Category.includes(:listings).where('listings.paid' => true).order('listings.created_at DESC', title: :asc)
    @category = Category.find(params[:category]) if params[:category]
    @company_name = params[:company_name]
    @industry = params[:industry]
    puts @industry
    respond_to do |format|
      format.html
      format.json { render :layout => false }
      format.rss { render :layout => false }
    end
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @company_name = @listing.company_name
    @other_listings = Listing.where("id != ? and paid = ? and created_at >= ? and company_name = ?", @listing.id, true, Date.today - 60.days, @company_name)
    @other_listings_sticky = @other_listings.where(sticky: true).order('created_at desc')
    @other_listings_non_sticky = @other_listings.where(sticky: false).order('created_at desc')
    # @other_listings_sticky, @other_listings_non_sticky = [], []
    # @other_listings.each do |ol|
    #   @other_listings_sticky << ol if ol.sticky == true
    #   @other_listings_non_sticky << ol if ol.sticky == false
    # end
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to preview_job_path(@listing) }
        format.json { render :preview_job_path, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to preview_job_path(@listing) }
        format.json { render :preview_job_path, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  # def destroy
  #   @listing.destroy
  #   respond_to do |format|
  #     format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  def preview
  end

  def purchase
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def set_price
      @price = Price.where(active: true).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:title, :description, :category_id, :location, :how_to_apply, :company_name, :company_logo, :company_website, :company_email, :company_about, :highlight, :sticky, :logo_displayed, :industry)
    end

    def cant_perform_when_listing_is_paid
      if @listing.paid
        flash[:alert] = "No Access"
        redirect_to root_path
      end
    end

    def cant_perform_when_listing_is_unpaid
      if !@listing.paid
        flash[:alert] = "No Access"
        redirect_to root_path
      end
    end
end
