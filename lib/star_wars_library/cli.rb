class Cli
    
    def run
        welcome
        Api.get_films
        main
    end

    def main
        print_all
        episode_prompt
        episode_id = valid_id?(selection)
        updated_film = get_film_details(episode_id)
        print_details(updated_film)
        print_continue
        continue?(selection)
    end

    def print_all
        list = Film.all.sort! { |a, b| a.episode_id <=> b.episode_id}
        list.each { |f| puts "#{f.episode_id}. #{f.title}"}
    end

    def print_error
        puts "We don't have information on that yet. Please try again."
    end

    def print_details(film)
        puts "Title: #{film.title}"
        sleep 0.5
        puts "Director: #{film.director}"
        sleep 0.5
        puts "Producer: #{film.producer}"
        sleep 0.5
        puts "Release Date: #{film.release_date}\n\n"
        sleep 0.5
        puts "#{film.opening_crawl}"
    end

    def print_continue
        puts "Would you like to learn about another film? (y/n)"
    end

    def episode_prompt
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

    def continue?(choice)
        if choice == 'y'
            main
        else
            print_goodbye
            exit
        end
    end

    def get_film_details(episode_id)
        selected_film = Film.find_by_id(episode_id)
        unless  selected_film.has_details?
            Api.get_film_details_by_number(episode_id)
        end
        selected_film
    end

    def welcome
        puts "Welcome to Star Wars Library!"
    end

    def print_goodbye
        puts "Goodbye and may the force be with you!"
    end
end