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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
