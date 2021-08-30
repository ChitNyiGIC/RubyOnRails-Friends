require "application_system_test_case"

class FriendContactsTest < ApplicationSystemTestCase
  setup do
    @friend_contact = friend_contacts(:one)
  end

  test "visiting the index" do
    visit friend_contacts_url
    assert_selector "h1", text: "Friend Contacts"
  end

  test "creating a Friend contact" do
    visit friend_contacts_url
    click_on "New Friend Contact"

    fill_in "Email", with: @friend_contact.email
    fill_in "First name", with: @friend_contact.first_name
    fill_in "Last name", with: @friend_contact.last_name
    fill_in "Phone", with: @friend_contact.phone
    fill_in "Twitter", with: @friend_contact.twitter
    click_on "Create Friend contact"

    assert_text "Friend contact was successfully created"
    click_on "Back"
  end

  test "updating a Friend contact" do
    visit friend_contacts_url
    click_on "Edit", match: :first

    fill_in "Email", with: @friend_contact.email
    fill_in "First name", with: @friend_contact.first_name
    fill_in "Last name", with: @friend_contact.last_name
    fill_in "Phone", with: @friend_contact.phone
    fill_in "Twitter", with: @friend_contact.twitter
    click_on "Update Friend contact"

    assert_text "Friend contact was successfully updated"
    click_on "Back"
  end

  test "destroying a Friend contact" do
    visit friend_contacts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Friend contact was successfully destroyed"
  end
end
