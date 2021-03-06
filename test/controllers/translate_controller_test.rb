require 'test_helper'

class TranslateControllerTest < ActionDispatch::IntegrationTest
  test "translate 0" do
    get "/0"
    result = JSON.parse(@response.body)
    assert_equal "zero", result["extenso"]
  end

  test "translate 1" do
    get "/1"
    result = JSON.parse(@response.body)
    assert_equal "um", result["extenso"]
  end

  test "translate -1" do
    get "/-1"
    result = JSON.parse(@response.body)
    assert_equal "menos um", result["extenso"]
  end

  test "translate 17" do
    get "/17"
    result = JSON.parse(@response.body)
    assert_equal "dezessete", result["extenso"]
  end

  test "translate -13" do
    get "/-13"
    result = JSON.parse(@response.body)
    assert_equal "menos treze", result["extenso"]
  end

  test "translate 37" do
    get "/37"
    result = JSON.parse(@response.body)
    assert_equal "trinta e sete", result["extenso"]
  end

  test "translate -79" do
    get "/-79"
    result = JSON.parse(@response.body)
    assert_equal "menos setenta e nove", result["extenso"]
  end

  test "translate -100" do
    get "/-100"
    result = JSON.parse(@response.body)
    assert_equal "menos cem", result["extenso"]
  end

  test "translate -879" do
    get "/-879"
    result = JSON.parse(@response.body)
    assert_equal "menos oitocentos e setenta e nove", result["extenso"]
  end

  test "translate -900" do
    get "/-900"
    result = JSON.parse(@response.body)
    assert_equal "menos novecentos", result["extenso"]
  end

  test "translate 918" do
    get "/918"
    result = JSON.parse(@response.body)
    assert_equal "novecentos e dezoito", result["extenso"]
  end

  test "translate 1000" do
    get "/1000"
    result = JSON.parse(@response.body)
    assert_equal "mil", result["extenso"]
  end

  test "translate -79001" do
    get "/-79001"
    result = JSON.parse(@response.body)
    assert_equal "menos setenta e nove mil e um", result["extenso"]
  end

  test "translate 94587" do
    get "/94587"
    result = JSON.parse(@response.body)
    assert_equal "noventa e quatro mil e quinhentos e oitenta e sete", result["extenso"]
  end

  # Error handling tests
  test "translation error: value out of bounds" do
    get "/100000"
    assert_response 422
  end

  test "translation error: value is invalid" do
    get "/string"
    assert_response 400
  end
end
