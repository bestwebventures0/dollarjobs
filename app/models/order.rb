# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  listing_id :integer
#  price      :float
#  status     :string
#  payment_id :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
  include OrderConcerns::Razorpay
  belongs_to :listing

  [:authorized, :captured, :refunded, :error].each do |scoped_key|
    scope scoped_key, -> { where('LOWER(status) = ?', scoped_key.to_s.downcase) }
  end

  class << self
    def process_razorpayment(params)
      listing = Listing.find(params[:listing_id])
      order_amount = listing.total_cost_rupees * 100
      order_amount_backend = order_amount / 100
      razorpay_pmnt_obj = fetch_payment(params[:payment_id])
      status = fetch_payment(params[:payment_id]).status
      if status == "authorized"
        razorpay_pmnt_obj.capture({amount: order_amount})
        razorpay_pmnt_obj = fetch_payment(params[:payment_id])
        params.merge!({status: razorpay_pmnt_obj.status, price: order_amount_backend})
        order = Order.new(params)
      else
        raise StandardError, "UNable to capture payment"
      end
    end

    def filter(params)
      scope = params[:status] ? Order.send(params[:status]) : Order.authorized
      return scope
    end
  end

end
