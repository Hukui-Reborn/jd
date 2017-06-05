class GoodsCollectionsController < ApplicationController
before_action :authenticate_user!

 def index
   @products = current_user.collections.order("created_at DESC").paginate(:page =>params[:page],:per_page => 8)
 end



end
