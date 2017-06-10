class WelcomeController < ApplicationController
  def index
     result1 = Product.limit((Product.count-6))

     @datas = result1.reverse.paginate(:page => params[:page], :per_page => 8)

 end
end
