require "application_system_test_case"

class InternshipsTest < ApplicationSystemTestCase
  setup do
    @internship = internships(:one)
  end

  test "visiting the index" do
    visit internships_url
    assert_selector "h1", text: "Internships"
  end

  test "creating a Internship" do
    visit internships_url
    click_on "New Internship"

    fill_in "Adress", with: @internship.adress
    fill_in "City", with: @internship.city
    fill_in "Notation", with: @internship.notation
    fill_in "Organization", with: @internship.organization
    fill_in "Population", with: @internship.population
    fill_in "Specialty", with: @internship.specialty
    fill_in "Zipcode", with: @internship.zipcode
    click_on "Create Internship"

    assert_text "Internship was successfully created"
    click_on "Back"
  end

  test "updating a Internship" do
    visit internships_url
    click_on "Edit", match: :first

    fill_in "Adress", with: @internship.adress
    fill_in "City", with: @internship.city
    fill_in "Notation", with: @internship.notation
    fill_in "Organization", with: @internship.organization
    fill_in "Population", with: @internship.population
    fill_in "Specialty", with: @internship.specialty
    fill_in "Zipcode", with: @internship.zipcode
    click_on "Update Internship"

    assert_text "Internship was successfully updated"
    click_on "Back"
  end

  test "destroying a Internship" do
    visit internships_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Internship was successfully destroyed"
  end
end
