class ListingMailer < ApplicationMailer

  default from: 'no-reply@dollarjobs.co'

  def listing_created
    @order = params[:order]
    @listing = params[:listing]
    mail(to: @listing.company_email, subject: "You have successfully created AD for job opening at your company! Your Listing id is: #{@listing.id}")
  end

end
