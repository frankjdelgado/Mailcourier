class PackageMailer < ActionMailer::Base

  default from: ENV["GMAIL_USERNAME"]

  def arrived(user,package)
    @username = user.username
    @url = package_url(package)
    @agency = package.agency.location
    mail(to: user.email, subject: 'Package Arrived')
  end

end
