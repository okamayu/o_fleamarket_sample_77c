class ItemsController < ApplicationController
  before_action :set_item, only: [:confirm, :destroy, :show]
  before_action :set_category
  # before_action :set_category, only: [:index, :new]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
    @item.images.new
    @category_parent_array = ["---"]
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.images.new
      render :new
    end
  end

  def edit
  end

  def show
    @items = Item.all
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      flash[:notice] = "削除に失敗しました"
    end
  end

  def confirm
    if @item.user_id != current_user.id
    redirect_to root_path
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :item_name,:detail,:condition,:delivery_fee,:shipping_area,:delivery_time,:price,:brand_id,:category_id,images_attributes:  [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_category
    @category_parent_array = Category.where(ancestry: nil)
  end

end



