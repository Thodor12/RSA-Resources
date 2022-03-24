require_relative "../post_test_helper.rb"

class TestPostNames < ActiveSupport::TestCase
  param_test "%s check valid post name",
  PostLoader.get_posts().each do |post|
    assert_match(/^\d{4,}-\d{2,}-\d{2,}-\S*\.md$/, post.filename, "Filename \"#{post.filename}\" does not match pattern YYYY-MM-DD-article-name.md")
  end
end