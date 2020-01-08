require 'test_helper'

class SeedlistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @seedlist = seedlists(:one)
  end

  test "should get index" do
    get seedlists_url, as: :json
    assert_response :success
  end

  test "should create seedlist" do
    assert_difference('Seedlist.count') do
      post seedlists_url, params: { seedlist: { name: @seedlist.name, year: @seedlist.year } }, as: :json
    end

    assert_response 201
  end

  test "should show seedlist" do
    get seedlist_url(@seedlist), as: :json
    assert_response :success
  end

  test "should update seedlist" do
    patch seedlist_url(@seedlist), params: { seedlist: { name: @seedlist.name, year: @seedlist.year } }, as: :json
    assert_response 200
  end

  test "should destroy seedlist" do
    assert_difference('Seedlist.count', -1) do
      delete seedlist_url(@seedlist), as: :json
    end

    assert_response 204
  end
end
