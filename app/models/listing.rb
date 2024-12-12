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

class Listing < ApplicationRecord

  belongs_to :category
  has_one :order

  validates_presence_of :title, :description, :category_id, :location, :how_to_apply, :company_name, :company_email, :company_about, :industry
  validates :company_email, format: { with: /\A[^@,\s]+@[^@,\s]+\.[^@,\s]+\z/ }
  validates :company_website, :format => URI::regexp(%w(http https))

  has_rich_text :description
  has_rich_text :how_to_apply
  has_rich_text :company_about

  has_one_attached :company_logo

  def new
    # A listing stays new for 3 days
    self.created_at >= Date.today - 3
  end

  def listing_cost_usd
    price = Price.where(active: true).first
    price.basic
  end

  def total_cost_usd
    tc = listing_cost_usd
    price = Price.where(active: true).first
    if sticky and highlight and logo_displayed
      tc + price.sticky + price.highlight + price.logo_displayed
    elsif sticky and highlight
      tc + price.sticky + price.highlight
    elsif sticky and logo_displayed
      tc + price.sticky + price.logo_displayed
    elsif highlight and logo_displayed
      tc + price.highlight + price.logo_displayed
    elsif sticky
      tc + price.sticky
    elsif logo_displayed
      tc + price.logo_displayed
    elsif highlight
      tc + price.highlight
    else
      tc
    end
  end

  def total_cost_rupees
    total_cost_usd * 72
  end

  def to_param
    slug = title.parameterize
    "#{id}-#{slug}"
  end

  def self.ransackable_associations(auth_object = nil)
    ["category", "company_logo_attachment", "company_logo_blob", "order", "rich_text_company_about", "rich_text_description", "rich_text_how_to_apply"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "company_email", "company_name", "company_website", "created_at", "expired", "highlight", "id", "industry", "location", "logo_displayed", "paid", "sticky", "title", "updated_at"]
  end

end
