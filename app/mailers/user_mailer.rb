class UserMailer < ApplicationMailer

  def welcome(manager, commissioner)
    @manager = manager
    @commissioner = commissioner
    mail(to: @manager.email, :subject => "You've been added to #{@commissioner.name}'s league on Commissioner Dashboard'")
  end

  def manager(manager, commissioner, subject, content)
    @manager = manager
    @commissioner = commissioner
    @subject = subject
    @content = content
    mail(to: @manager.email, :subject => "#{@subject}")
  end

end
