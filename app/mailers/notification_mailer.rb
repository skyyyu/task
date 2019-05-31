class NotificationMailer < ApplicationMailer
	default from: "hogehoge@example.com"

  def send_confirm_to_user(task)
    @task = task

    mail(
      subject: "タスクを登録しました" ,
      to: @task.user.email
    ) do |format|
      format.text
    end
  end
end
