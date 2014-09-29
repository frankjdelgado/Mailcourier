class PackageMailer < ActionMailer::Base

  default from: ENV["GMAIL_USERNAME"]

  def arrived(user,agency)
    @username = user.username
    @agency = agency
    mail(to: user.email, subject: 'Package Arrived')
  end

end
