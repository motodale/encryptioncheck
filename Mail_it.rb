require 'rubygems'
require 'pony'


class Mail_it
  attr_accessor :user
  attr_accessor :body

  def initialize(user,body)
    @user = user
    @body = body
    Pony.mail(:to => 'yourmail@somemail.com', :subject => "security from #{@user}", :body => "#{@body}" )
  end
end
