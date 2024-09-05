require 'http'

class RandomUserService
  API_URL = 'https://randomuser.me/api/'

  def self.fetch_random_user
    response = HTTP.get(API_URL)
    JSON.parse(response.body)['results']
  end
end
