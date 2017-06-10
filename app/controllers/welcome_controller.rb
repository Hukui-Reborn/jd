class WelcomeController < ApplicationController
  def index
    # 我这边本地无法运行，所以修改了部分参数，更加直观一些
    @products = Product.all
    @datas = @products.reverse.paginate(:page => params[:page], :per_page => 8)
     #result1 = product.limit((product.count-6))
     #@datas = result1.reverse.paginate(:page => params[:page], :per_page => 8)
 end
end
