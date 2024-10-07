require "application_system_test_case"

class ListingsTest < ApplicationSystemTestCase
  setup do
    @listing = listings(:one)
  end

  test "visiting the index" do
    visit listings_url
    assert_selector "h1", text: "Listings"
  end

  test "creating a Listing" do
    visit listings_url
    click_on "New Listing"

    fill_in "Category", with: @listing.category_id
    fill_in "Company about", with: @listing.company_about
    fill_in "Company email", with: @listing.company_email
    fill_in "Company name", with: @listing.company_name
    fill_in "Company website", with: @listing.company_website
    fill_in "Description", with: @listing.description
    fill_in "Highlight", with: @listing.highlight
    fill_in "How to apply", with: @listing.how_to_apply
    fill_in "Location", with: @listing.location
    fill_in "Logo displayed", with: @listing.logo_displayed
    fill_in "Sticky", with: @listing.sticky
    fill_in "Title", with: @listing.title
    click_on "Create Listing"

    assert_text "Listing was successfully created"
    click_on "Back"
  end

  test "updating a Listing" do
    visit listings_url
    click_on "Edit", match: :first

    fill_in "Category", with: @listing.category_id
    fill_in "Company about", with: @listing.company_about
    fill_in "Company email", with: @listing.company_email
    fill_in "Company name", with: @listing.company_name
    fill_in "Company website", with: @listing.company_website
    fill_in "Description", with: @listing.description
    fill_in "Highlight", with: @listing.highlight
    fill_in "How to apply", with: @listing.how_to_apply
    fill_in "Location", with: @listing.location
    fill_in "Logo displayed", with: @listing.logo_displayed
    fill_in "Sticky", with: @listing.sticky
    fill_in "Title", with: @listing.title
    click_on "Update Listing"

    assert_text "Listing was successfully updated"
    click_on "Back"
  end

  test "destroying a Listing" do
    visit listings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Listing was successfully destroyed"
  end
end
