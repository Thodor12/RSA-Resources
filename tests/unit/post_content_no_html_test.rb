require_relative "../post_test_helper.rb"

class TestPostContentNoHtml < ActiveSupport::TestCase
  param_test "%s no html content",
  PostLoader.get_posts().each do |post|
    content = post.content

    # Ignore code blocks, code and blockquotes
    content = content.gsub(/```[a-z]*\n?[\s\S]*?\n```/, "")
    content = content.gsub(/`.*?`/, "")
    content = content.gsub(/^ ?> ?\S*/, "")

    assert_no_match(/<[^>]*>/, content, "Post content seems to be using HTML content, please remove this content")
  end
end