require_relative "post"

class PostLoader
    def self.get_posts()
        files = Dir.entries("pages/source/_posts")
        files.select { |filename| filename !~ /^..?$/ }
            .map { |filename| Post.new("pages/source/_posts/", filename) }
    end
end