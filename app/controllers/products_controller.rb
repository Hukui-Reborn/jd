class ProductsController < ApplicationController
  before_action :authenticate_user!, only:[:collect, :remove,:add_to_cart,:upvote, :downvote,:new, :edit,:update,:follow, :unfollow]
  before_action :validate_search_key, only:[:search]
  before_action :validate_title_key, only:[:title]

  def follow
     @product = Product.find(params[:id])
     @user = @product.user
     if @user ==current_user
       flash[:notice] = "无法关注自己"

     elsif
        !@user.has_follower?(current_user)
       @user.follow!(current_user)
       flash[:notice] = "感谢关注"
     else
       flash[:warning] = "你已经关注过该作者！"
     end
     redirect_to :back
   end

   def unfollow
     @product = Product.find(params[:id])
     @user = @product.user

     if @user == current_user
      flash[:warning]="你无法取消关注自己"

     elsif @user.has_follower?(current_user)
       @user.unfollow!(current_user)
       flash[:notice] = "取消关注成功"
     else
       flash[:warning] = "你尚未关注该作者！"
     end
     redirect_to :back
   end

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.creator = current_user.user_name
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end

  end

  def show
    @product = Product.find(params[:id])
    @comments =@product.comments.recent.paginate(:page => params[:page], :per_page => 5)
    @comment = Comment.new
    @user = @product.user
  end

  def edit
    @product = Product.find(params[:id])
    if @product.user != current_user
      redirect_to root_path,alert:"你无权修改他人文章"
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def title
    if @title_string.present?
      title_result = Product.ransack(@title_criteria).result(:distinct => true)
      @products = title_result.paginate(:page => params[:page], :per_page => 8)
    end
    @title_user = User.find_by_user_name(@title_string)

  end

  def search
    if @query_string.present?
      search_result = Product.ransack(@search_criteria).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 8)
    end
  end

  def upvote
    @product = Product.find(params[:id])
    if !current_user.is_voter_of?(@product)
      current_user.like!(@product)
      flash[:notice]= "您已点赞了该篇文章"
    else
      flash[:warning]= "您已点赞过该篇文章，无法重复点赞"
    end
    redirect_to :back
  end

  def downvote
    @product = Product.find(params[:id])
    if !current_user.is_anti_of?(@product)
      current_user.dislike!(@product)
      flash[:notice]= "您已踩了该商品"
    else
      flash[:warning]= "您已踩过该商品，无法重复踩它"
    end
    redirect_to :back

  end


  def collect
    @product = Product.find(params[:id])
    if !current_user.is_collector_of?(@product)
      current_user.collect!(@product)
      flash[:notice]= "已收藏该商品"

    else
      flash[:warning]="您已收藏过该篇文章"
    end
    redirect_to product_path(@product)
  end

  def remove
    @product = Product.find(params[:id])
    if current_user.is_collector_of?(@product)
      current_user.remove!(@product)
      flash[:alert]= "已取消收藏该篇文章"
    else
      flash[:warning]= "您未收藏该篇文章,无法取消收藏"
    end
    redirect_to product_path(@product)

  end


  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "成功将#{@product.title}加入购物车"
    else
      flash[:warning] = "你的购物车内已有此商品"
    end
    redirect_to :back
  end

  def follow
    @product = Product.find(params[:id])
    @user = @product.user
    if !@user.has_follower?(current_user)
      @user.follow!(current_user)
      flash[:notice] = "感谢关注"
    else
      flash[:warning] = "你已经关注过该作者！"
    end
    redirect_to :back
  end

  def unfollow
    @product = Product.find(params[:id])
    @user = @product.user
    if @user.has_follower?(current_user)
      @user.unfollow!(current_user)
      flash[:notice] = "取消关注成功"
    else
      flash[:warning] = "你尚未关注该作者！"
    end
    redirect_to :back
  end

  private
  def product_params
    params.require(:product).permit(:title,:description,:quantity,:price,:image,:reply_time,:expertname,:experttitle, :post,:user_id,:creator)
  end

  protected

  def validate_title_key
    @title_string= params[:t].gsub(/\\|\'|\/|\?/, "") if params[:t].present?
    @title_criteria = title_criteria(@title_string)
  end

  def title_criteria(title_string)
    {:creator_cont => title_string}
  end


  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end


  def search_criteria(query_string)
    { :title_cont => query_string }
  end
end
