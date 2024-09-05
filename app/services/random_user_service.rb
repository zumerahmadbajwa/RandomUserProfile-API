require 'http'

class RandomUserService
  API_URL = 'https://randomuser.me/api/'

  def self.fetch_random_user
    response = HTTP.get(API_URL)
    user = JSON.parse(response.body)['results'].first
    {
      first_name: user['name']['first'],
      last_name: user['name']['last'],
      email: user['email'],
      gender: user['gender'],
      city: user['location']['city'],
      country: user['location']['country'],
      picture: user['picture']['large']
    }
  end
end
