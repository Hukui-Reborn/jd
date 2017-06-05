class WelcomeController < ApplicationController
  def index
     @datas = Product.all.paginate(:page => params[:page], :per_page => 8)
  end
end
