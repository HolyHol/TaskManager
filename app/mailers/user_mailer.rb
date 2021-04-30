class UserMailer < ApplicationMailer
  default from: 'noreply@taskmanager.com'

  def task_created
    user = params[:user]
    @task = params[:task]

    mail(to: user.email, subject: 'New Task Created')
  end

  def task_updated
    user = params[:user]
    @task = params[:task]

    mail(to: user.email, subject: 'Task updated')
  end

  def task_deleted
    user = params[:user]
    @task = params[:task]

    mail(to: user.email, subject: 'Task deleted')
  end
end