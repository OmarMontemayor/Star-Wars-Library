class Cli
    
    def run
        welcome
        Api.get_films
        main
    end

    def main
        print_all
        selection_prompt
        episode_id = valid_id?(selection)
        get_film_details(episode_id)
    end

    def print_all
        list = Film.all.sort { |a, b| a.episode_id <=> b.episode_id}
        list.each { |f| puts "#{f.episode_id}. #{f.title}"}
    end

    def print_error
        puts "We don't have information on that yet. Please try again."
    end

    def selection_prompt
        puts "Please select a film by number to learn more about!"
    end

    def selection
        gets.chomp
    end

    def valid_id?(episode_id)
        episode_id = episode_id.to_i
        if episode_id < 1 || episode_id > Film.all.size
            print_error
            sleep 2
            main
        end
        episode_id
    end

    def get_film_details(episode_id)
        Api.get_details_by_id(episode_id)
    end

    def welcome
        puts "Welcome to Star Wars Library!"
    end
end