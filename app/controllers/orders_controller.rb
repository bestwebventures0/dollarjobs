class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

  def purchase_status
    begin
      @order = Order.process_razorpayment(payment_params)
      if @order.save
        @order.listing.paid = true
        @order.listing.save
        flash[:notice] = "Thanks for listing your job ad."
        ListingMailer.with(order: @order, listing: @order.listing).listing_created.deliver_later
        redirect_to listing_path(@order.listing)
      end
    rescue Exception
      flash[:alert] = "Unable to process payment."
      redirect_to root_path
    end
  end

  private
    def payment_params
      p = params.permit(:payment_id, :listing_id, :order_amount, :price, :razorpay_payment_id)
      p.merge!({payment_id: p.delete(:razorpay_payment_id) || p[:payment_id]})
      p
    end

    def filter_params
      params.permit(:status, :page)
    end
end
