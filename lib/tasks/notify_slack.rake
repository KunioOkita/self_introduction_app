# coding: utf-8
namespace :notify_slack do
  desc "誕生日を通知するタスク"
  # task_name => タスクの名前
  task birth_day: :environment do
    # 本日の日・月を取得する
    now = Time.current
    month = now.month
    day = now.day
    user_self_introductions = UserSelfIntroduction.where(birth_day: day, birth_month: month)
    user_self_introductions.each do |user_self_introduction|
      # 通知する
      notifier = Slack::Notifier.new(
        ENV["WEBHOOK_URL"],
        channel: "#" + ENV["CHANNEL"]
      )
      url = "#{ENV['APP_BASE_URL']}#{user_self_introduction.base_uri}"
      body = ":confetti_ball::tada::birthday: [#{user_self_introduction.user.name}](#{url})さん 誕生日おめでとうございます!! :birthday::tada::confetti_ball:"
      notifier.ping body
    end
  end
end
