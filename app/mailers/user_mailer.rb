class UserMailer < ApplicationMailer
 
  def notification_email(user, contract, url)
    @user = user
    @url = url
    @employment_contract = contract
    @admins = User.where(admin: true)
    admins = @admins.collect(&:email).join(",")
    mail(from: @user.email, to: admins, subject: 'Employee Setup Request')
  end

end