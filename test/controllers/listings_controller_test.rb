require 'test_helper'

class ListingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @listing = listings(:one)
  end

  test "should get index" do
    get listings_url
    assert_response :success
  end

  test "should get new" do
    get new_listing_url
    assert_response :success
  end

  test "should create listing" do
    assert_difference('Listing.count') do
      post listings_url, params: { listing: { category_id: @listing.category_id, company_about: @listing.company_about, company_email: @listing.company_email, company_name: @listing.company_name, company_website: @listing.company_website, description: @listing.description, highlight: @listing.highlight, how_to_apply: @listing.how_to_apply, location: @listing.location, logo_displayed: @listing.logo_displayed, sticky: @listing.sticky, title: @listing.title } }
    end

    assert_redirected_to listing_url(Listing.last)
  end

  test "should show listing" do
    get listing_url(@listing)
    assert_response :success
  end

  test "should get edit" do
    get edit_listing_url(@listing)
    assert_response :success
  end

  test "should update listing" do
    patch listing_url(@listing), params: { listing: { category_id: @listing.category_id, company_about: @listing.company_about, company_email: @listing.company_email, company_name: @listing.company_name, company_website: @listing.company_website, description: @listing.description, highlight: @listing.highlight, how_to_apply: @listing.how_to_apply, location: @listing.location, logo_displayed: @listing.logo_displayed, sticky: @listing.sticky, title: @listing.title } }
    assert_redirected_to listing_url(@listing)
  end

  test "should destroy listing" do
    assert_difference('Listing.count', -1) do
      delete listing_url(@listing)
    end

    assert_redirected_to listings_url
  end
end
