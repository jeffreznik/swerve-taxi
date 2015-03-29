class OrdersController < ApplicationController
  def new
    protected_action

    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    protected_action

    @order = Order.new(order_params)
    @order.user_id = session[:user_id]

    if @order.save
      redirect_to profile_path
    else
      flash[:danger] = 'Unable to create order'
      render 'new'
    end
  end

  def update
    protected_action

    @order = Order.find(params[:id])
    @order.address = params[:order][:address]

    if @order.save
      redirect_to profile_path
    else
      flash[:warning] = 'Unable to save order'
      render 'edit'
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
