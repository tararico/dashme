require 'test_helper'
require "minitest/mock"

class SlackWorkspaceTest < ActiveSupport::TestCase
  test "notify" do
    text = "hoge"
    link = "https://hoge.com"
    workspace = SlackWorkspace.new

    mock_log = ""
    stub_info = Proc.new { |i| mock_log << i }
    Rails.logger.stub(:info, stub_info) do
      workspace.notify(text, link)
      assert_match "Notify\ntext:#{text}\nlink:#{link}", mock_log
    end
  end
end
