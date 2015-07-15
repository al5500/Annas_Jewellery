class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin, :only => [:new, :create, :edit, :update, :destroy ]
  # GET /products
  # GET /products.json
  def index
    @products = Product.all

    if params[:search_products]
      @products = Product.search(params[:search_products]).order("created_at DESC")
    else
      @products = Product.all.order('created_at DESC')
    end
  end


  def search  
    if params[:commit] == "Find Product"
      @products = Product.search( params[:search] )
      render :index
    else
      @products = Product.search( params[:search] )
      render :search
    end
  end
  # GET /products/1
  # GET /products/1.json
  def show 
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    if params[:product]['file'].present?
      cloudinary = Cloudinary::Uploader.upload(params[:product]['file'].path)
      @product.cl_id = cloudinary['public_id']
    end
    if params[:product]['image_one'].present?
      cloudinary = Cloudinary::Uploader.upload(params[:product]['image_one'].path)
      @product.image_one = cloudinary['public_id']
    end
    if params[:product]['image_two'].present?
      cloudinary = Cloudinary::Uploader.upload(params[:product]['image_two'].path)
      @product.image_two = cloudinary['public_id']
    end
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    product = Product.find params[:id]
    if params[:product]['file'].present?
      cloudinary = Cloudinary::Uploader.upload(params[:product]['file'].path)
      product.cl_id = cloudinary['public_id']
    end
    if params[:product]['image_one'].present?
      cloudinary = Cloudinary::Uploader.upload(params[:product]['image_one'].path)
      @product.image_one = cloudinary['public_id']
    end
    if params[:product]['image_two'].present?
      cloudinary = Cloudinary::Uploader.upload(params[:product]['image_two'].path)
      @product.image_two = cloudinary['public_id']
    end
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :cl_id, :price, :category_id)
    end
end
