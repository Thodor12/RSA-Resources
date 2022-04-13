class Post
    def initialize(dir, filename)
        @dir = dir
        @filename = filename
    end

    def filename
        @filename
    end

    def content
        File.open(@dir + @filename).read
    end

    def to_s
        @filename
    end
end