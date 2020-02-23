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

  test "translate 17" do
    get "/17"
    result = JSON.parse(@response.body)
    assert_equal result["extenso"], "dezessete"
  end

  test "translate -13" do
    get "/-13"
    result = JSON.parse(@response.body)
    assert_equal result["extenso"], "menos treze"
  end

  test "translate 37" do
    get "/37"
    result = JSON.parse(@response.body)
    assert_equal result["extenso"], "trinta e sete"
  end

  test "translate -79" do
    get "/-79"
    result = JSON.parse(@response.body)
    assert_equal result["extenso"], "menos setenta e nove"
  end

  test "translate -100" do
    get "/-100"
    result = JSON.parse(@response.body)
    assert_equal result["extenso"], "menos cem"
  end

  test "translate -879" do
    get "/-879"
    result = JSON.parse(@response.body)
    assert_equal result["extenso"], "menos oitocentos e setenta e nove"
  end

  test "translate -900" do
    get "/-900"
    result = JSON.parse(@response.body)
    assert_equal result["extenso"], "menos novecentos"
  end

  test "translate 918" do
    get "/918"
    result = JSON.parse(@response.body)
    assert_equal result["extenso"], "novecentos e dezoito"
  end
end
