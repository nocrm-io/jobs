require "application_system_test_case"

class LeadsTest < ApplicationSystemTestCase
  setup do
    @lead = leads(:one)
  end

  test "visiting the index" do
    visit leads_url
    assert_selector "h1", text: "Leads"
  end

  test "creating a Lead" do
    visit leads_url
    click_on "New Lead"

    fill_in "Amount", with: @lead.amount
    fill_in "Description", with: @lead.description
    fill_in "Name", with: @lead.name
    fill_in "Probability", with: @lead.probability
    fill_in "Status", with: @lead.status
    click_on "Create Lead"

    assert_text "Lead was successfully created"
    click_on "Back"
  end

  test "updating a Lead" do
    visit leads_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @lead.amount
    fill_in "Description", with: @lead.description
    fill_in "Name", with: @lead.name
    fill_in "Probability", with: @lead.probability
    fill_in "Status", with: @lead.status
    click_on "Update Lead"

    assert_text "Lead was successfully updated"
    click_on "Back"
  end

  test "destroying a Lead" do
    visit leads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lead was successfully destroyed"
  end
end
