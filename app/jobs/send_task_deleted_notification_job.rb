class SendTaskDeletedNotificationJob < ApplicationJob
  sidekiq_options queue: :mailers
  sidekiq_throttle_as :mailer

  def perform(task_id, user_id)
    user = User.find(user_id)
    UserMailer.with(user: user, task_id: task_id).task_deleted.deliver_now
  end
end
