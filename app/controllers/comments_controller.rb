class CommentsController < ApplicationController

  before_action :authenticate_user!, only:[:create]



  def create
    @product = Product.find(params[:product_id])
    @comment=Comment.new(comment_params)
    @comment.product = @product
    @comment.user = current_user

    if @comment.save
      redirect_to product_path(@product)
    else
      redirect_to product_path(@product)
      flash[:alert]='留言内容不能为空'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id,:product_id, :content)
  end





end
