# == Schema Information
#
# Table name: listings
#
#  id              :integer          not null, primary key
#  company_email   :string
#  company_name    :string
#  company_website :string
#  expired         :boolean
#  highlight       :boolean
#  industry        :string
#  location        :string
#  logo_displayed  :boolean
#  paid            :boolean
#  sticky          :boolean
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category_id     :integer
#

require 'test_helper'

class ListingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
