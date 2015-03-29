class OrdersController < ApplicationController
  def new
    protected_action

    @order = Order.new
  end

  def create
    protected_action

    @order = Order.new(order_params)
    @order.user_id = session[:user_id]

    if @order.save
      redirect_to profile_path
    else
      render 'new'
    end
  end

  def destroy
    protected_action

    @order = Order.find(params[:id])
    @order.destroy!

    redirect_to :back
  end

  private
    def order_params
      params.require(:order).permit(:address)
    end
end
