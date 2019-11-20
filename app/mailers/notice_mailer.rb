class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.agreed.subject
  #
    def agreed(entry)
       @content = "#{entry.room.name}を#{entry.reserved_date}に#{entry.usage_time}時間予約完了しました。"
       mail to: entry.user.email
     end
end
