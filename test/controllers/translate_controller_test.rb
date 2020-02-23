require 'test_helper'

class TranslateControllerTest < ActionDispatch::IntegrationTest
  test "translate 0" do
    get "/0"
    result = JSON.parse(@response.body)
    assert_equal result["extenso"], "zero"
  end

  test "translate 1" do
    get "/1"
    result = JSON.parse(@response.body)
    assert_equal result["extenso"], "um"
  end

  test "translate -1" do
    get "/-1"
    result = JSON.parse(@response.body)
    assert_equal result["extenso"], "menos um"
  end
end
