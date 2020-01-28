class SlackWorkspace < ApplicationRecord
  belongs_to :family

  def notify(text, link)
    if Rails.env.production?
      notifier = Slack::Notifier.new webhook_url
      notifier.ping "#{text}を買い物リストに追加しました。#{link}"
    else
      Rails.logger.info "Notify\ntext:#{text}\nlink:#{link}"
    end
  end

  def inform(text, link)
    if Rails.env.production?
      notifier = Slack::Notifier.new webhook_url
      notifier.ping "#{text}を買いました。#{link}"
    else
      Rails.logger.info "Inform\ntext:#{text}\nlink:#{link}"
    end
  end
end
