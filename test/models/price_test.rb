# == Schema Information
#
# Table name: prices
#
#  id             :integer          not null, primary key
#  basic          :integer
#  sticky         :integer
#  highlight      :integer
#  logo_displayed :integer
#  active         :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class PriceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
