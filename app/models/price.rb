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

class Price < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["active", "basic", "created_at", "highlight", "id", "logo_displayed", "sticky", "updated_at"]
  end
end
