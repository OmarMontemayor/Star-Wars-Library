class Api
    
    BASE_URL = 'https://swapi.dev/api/'

    def self.get_films
        response = RestClient.get(BASE_URL + "films/")
        data = JSON.parse(response.body)
        data['results'].each do |film|
            title = film['title']
            episode_id = film['episode_id']
            Film.new(title, episode_id) 
        end
    end

    def self.get_details_by_id(episode_id)
        response = RestClient.get(BASE_URL + "films/" + "#{episode_id}/")
        data = JSON.parse(response.body)
        binding.pry
    end
end