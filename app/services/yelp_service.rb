class YelpService
  BASE_URL = "https://api.yelp.com/v3/businesses"
  class << self

    def search(term="", location="")
      url = "#{BASE_URL}/search"
      params = {
        term: term,
        location: location
      }

      response = HTTP.auth("Bearer #{yelp_api_key}").get(url, params: params)
      response.parse
    end

    def business(yelp_business_id)
      url = "#{BASE_URL}/#{yelp_business_id}"
      response = HTTP.auth("Bearer #{yelp_api_key}").get(url)
      response.parse
    end

    private

    def yelp_api_key
      Rails.application.secrets.yelp_api_key
    end
  end
end
