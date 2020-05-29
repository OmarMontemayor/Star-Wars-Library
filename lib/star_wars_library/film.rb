class Film
    attr_accessor :title, :episode_id
    @@all = []
    def initialize(title, episode_id)
        @title = title
        @episode_id = episode_id
        @@all << self
    end

    def self.all
        @@all
    end
end