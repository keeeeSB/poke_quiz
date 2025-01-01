require 'httparty'

class PokeService
  BASE_URL = "https://pokeapi.co/api/v2"

  def self.get_random_pokemon
    id = rand(1..1010)
    response = HTTParty.get("#{BASE_URL}/pokemon/#{id}")
    response.parsed_response if response.code == 200
  end
end
