#! /usr/bin/ruby

require_relative 'mactest'
require_relative 'mail_it'


class Main

  attr_accessor :user

  def initialize
    @user = ENV['USER']

    puts "\n\nChecking for encryption for #{@user}. \n\n"
    puts "This script will only take a sec.\n\n "
    if File.exists?('diskutil.txt')
      File.delete('diskutil.txt')
    end
    mactest = Mactest.new(@user)
    Mail_it.new(mactest.user,mactest.body)
    File.delete('diskutil.txt')
    puts "Check Complete\n\n"
  end
end

Main.new
