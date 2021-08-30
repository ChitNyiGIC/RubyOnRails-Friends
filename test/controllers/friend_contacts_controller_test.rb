require "test_helper"

class FriendContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friend_contact = friend_contacts(:one)
  end

  test "should get index" do
    get friend_contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_friend_contact_url
    assert_response :success
  end

  test "should create friend_contact" do
    assert_difference('FriendContact.count') do
      post friend_contacts_url, params: { friend_contact: { email: @friend_contact.email, first_name: @friend_contact.first_name, last_name: @friend_contact.last_name, phone: @friend_contact.phone, twitter: @friend_contact.twitter } }
    end

    assert_redirected_to friend_contact_url(FriendContact.last)
  end

  test "should show friend_contact" do
    get friend_contact_url(@friend_contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_friend_contact_url(@friend_contact)
    assert_response :success
  end

  test "should update friend_contact" do
    patch friend_contact_url(@friend_contact), params: { friend_contact: { email: @friend_contact.email, first_name: @friend_contact.first_name, last_name: @friend_contact.last_name, phone: @friend_contact.phone, twitter: @friend_contact.twitter } }
    assert_redirected_to friend_contact_url(@friend_contact)
  end

  test "should destroy friend_contact" do
    assert_difference('FriendContact.count', -1) do
      delete friend_contact_url(@friend_contact)
    end

    assert_redirected_to friend_contacts_url
  end
end
