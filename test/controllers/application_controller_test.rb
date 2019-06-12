require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test "home page should load" do
    get '/'
    assert_response 200
  end

  test "blank url should still redirect with q 'search'" do
    get '/search'
    redirected_url = Addressable::URI.parse(@response.redirect_url)
    assert_match 'search', redirected_url.query_values['q']
  end

  test "q shouldpass through to needed params" do
    get '/search?q=car'
    redirected_url = Addressable::URI.parse(@response.redirect_url)
    assert_match 'car', redirected_url.query_values['q']
    assert_match 'car', redirected_url.query_values['chnm2']
  end

  test "all needed params should be present" do
    expected_params = %w{q chnm chnm2 chnm3 convtrack}
    get '/search?q=car&utm_source=facebook&aid=1&utm_campaign=1'
    redirected_url = Addressable::URI.parse(@response.redirect_url)
    assert_match 'car', redirected_url.query_values['q']

    expected_params.each do |ep| assert redirected_url.query_values[ep].present? end
  end

  # test mapping of utm_source to chnm

  [['facebook', 'fb'], ['adwords', 'gs'], ['gdn', 'gdn'], ['bing', 'bing']].each do |source|
    test "source #{source[0]} copies to chnm correctly" do
      get "/search?q=car&utm_source=#{source[0]}"
      redirected_url = Addressable::URI.parse(@response.redirect_url)
      assert_match source[1], redirected_url.query_values['chnm']
    end
  end

  test "convtrack contains nested params" do
    get '/search?q=car'
    redirected_url = Addressable::URI.parse(@response.redirect_url)
    convtrack = CGI.parse(redirected_url.query_values['convtrack'])
    assert convtrack['id'].present?
    assert convtrack['properties_extra_value'].present?

    assert_match 'car', redirected_url.query_values['q']
  end



  # test "test data" do
  #   search = searches(:one)
  #   # get "/search?q=#{search.slug}"
  #   puts search
    
  # end

  # test "blank url with q should still redirect" do
  #   get '/search?q=car'
  #   redirected_url = Addressable::URI.parse(@response.redirect_url)
  #   assert_match 'car', redirected_url.query_values['q']
  # end
end