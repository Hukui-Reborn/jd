class WelcomeController < ApplicationController
  def index
     result=Product.where("id<8",Product.last.id-5).order("created_at DESC")
     @datas = result.paginate(:page => params[:page], :per_page => 8)
  end
end
