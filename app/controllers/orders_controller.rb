class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
  end

  def checkout
    @token = gateway.client_token.generate
    @order = Order.friendly.find(params[:id])
  end

  def pay
    @order = Order.friendly.find(params[:id])
    result = gateway.transaction.sale(
      amount: @order.price,
      payment_method_nonce: params[:nonce]
    )

    if result.success?
      @order.pay!
      redirect_to root_path, notice: "ok"
    else
      @order.fail!
      redirect_to root_path, alert: "fail"
    end
  end

  def cancel
    @order = Order.friendly.find(params[:id])

    @order.cancel!
    redirect_to orders_path, notice: "訂單已取消"
  end

  private

  def gateway
    Braintree::Gateway.new(
      environment: :sandbox,
      merchant_id: ENV["MERCHANT_ID"],
      public_key: ENV["PUBLIC_KEY"],
      private_key: ENV["PRIVATE_KEY"],
    )
  end

  
end