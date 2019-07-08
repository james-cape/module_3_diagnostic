require 'rails_helper'

feature "user can search for ingredient" do
  scenario "user submits ingredient name" do
    # As a user,
    # When I visit "/"
    visit '/'

    expect(current_path).to eq(root_path)

    # And I fill in the search form with "sweet potatoes"
    # (Note: Use the existing search form)
    # And I click "Search"
    fill_in :q, with: "sweet potatoes"
    click_on "Search"


    # Then I should be on page "/foods"
    expect(current_path).to eq("/foods")

    # Then I should see a total of the number of items returned by the search. (531 for sweet potatoes)
    expect(search_results.count).to eq(531)

    # Then I should see a list of ten foods sorted by relevance.
    expect(search_results.first.nbd_number).to eq("5")

    # And for each of the foods I should see:
    # - The food's NDB Number
    # - The food's name
    # - The food group to which the food belongs
    # - The food's data source
    # - The food's manufacturer
    expect(search_results.first.ndb_number).to eq("5")
    expect(search_results.first.ndb_number).to eq("pie")
    expect(search_results.first.ndb_number).to eq("dinner")
    expect(search_results.first.ndb_number).to eq("something.gov")
    expect(search_results.first.ndb_number).to eq("Tyson")




  end
end

#
