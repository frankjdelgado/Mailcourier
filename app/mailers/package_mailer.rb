class PackageMailer < ActionMailer::Base

  default from: "from@example.com"

  def arrived(user,package)
    @user = user
    @url  = package_path(package)
    @location = package.agency.location
    mail(to: @user.email, subject: 'Package Arrived')
  end

end
