require_relative "../post_test_helper.rb"

class TestPostContentNoAbsoluteUrls < ActiveSupport::TestCase
  param_test "%s no absolute urls",
  PostLoader.get_posts().each do |post|
    links = post.content.scan(/(?<!!)\[[^\[]+\]\((.*?)\)/)
    if links == nil
      return
    end

    absolute_urls = []
    links.each do |link|
      parsed = nil
      assert_nothing_raised do
        parsed = URI::DEFAULT_PARSER.parse(link[0])
      end

      if parsed.absolute
        absolute_urls.push(parsed)
      end
    end

    if !absolute_urls.empty?
      assert(false, "No absolute URLs are allowed in posts, found #{absolute_urls.size} absolute urls:\n#{absolute_urls.join("\n")}")
    end
  end
end