require 'http'

class RandomUserService
  API_URL = 'https://randomuser.me/api/'

  def self.fetch_random_user
    begin
      response = HTTP.get(API_URL)
      user = JSON.parse(response.body)['results'].first
       if user
        {
          first_name: user['name']['first'],
          last_name: user['name']['last'],
          email: user['email'],
          gender: user['gender'],
          city: user['location']['city'],
          country: user['location']['country'],
          picture: user['picture']['large']
        }
      else
        { error: 'No user data available' }
      end
    rescue HTTP::Error => e
      { error: "Error! #{e.message}" }
    end
  end
end
