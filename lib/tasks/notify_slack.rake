# coding: utf-8
namespace :notify_slack do
  desc "誕生日を通知するタスク"
  # task_name => タスクの名前
  task birth_day: :environment do
    Rails.logger.info "notify_slack:birth_day start."
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
      body = ":confetti_ball::confetti_ball::confetti_ball::confetti_ball::confetti_ball::confetti_ball::confetti_ball::confetti_ball::confetti_ball::confetti_ball: \n今日は [#{user_self_introduction.user.name}](#{url})さん の誕生日です！\nおめでとう:tada: \n:confetti_ball::confetti_ball::confetti_ball::confetti_ball::confetti_ball::confetti_ball::confetti_ball::confetti_ball::confetti_ball::confetti_ball:"
      notifier.post icon_emoji: ":birthday:", text: body, username: "Birthday Bot"
      Rails.logger.debug "notify_slack:birth_day detail=#{body}"

    end
    Rails.logger.info "notify_slack:birth_day end."
  end
end
