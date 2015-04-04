class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, :set_sorts
  respond_to :html, :js
  before_action :all_items, only: [:index, :create, :destroy, :update]
  # GET /items
  # GET /items.json
  def index
    @search = Item.search(params[:q])
    @search.sorts = 'name asc' if @search.sorts.empty?
    @items = @search.result
     if params[:q].present?
        params[:q].each do |k, v| 
      if v == 'name asc'
        @items = @search.result.sort { |p1, p2| p1.name.downcase <=> p2.name.downcase }
      elsif v == 'name desc'
        @items = @search.result.sort { |p2, p1| p1.name.downcase <=> p2.name.downcase }
      end
    end
  end
  end

  def all_items
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    vendor = Vendor.find(item_params[:vendor_id])
    @item.build_vendor(:id => vendor.id)
    @item.save!
    @current_item = @item
    @items = Item.all
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    @item.update!(item_params)
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :thumbnail, :price, :category, :sort)
    end
    def set_categories
      @categories = Item.categories
    end
    def set_sorts
      @sorts = Item.sorts
    end
    def item_params
        params.require(:item).permit(:name, :thumbnail, :price, :category, :sort, :vendor_id)
    end   
end
