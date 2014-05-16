#! /usr/bin/ruby

require_relative 'mactest'
require_relative 'linuxtest'
require_relative 'mail_it'


class Main

  attr_accessor :user

  def initialize
    @user = ENV['USER']

    platform = RUBY_PLATFORM

    case platform
      when /mswin|windows/i
        # Windows
      when /linux|arch/i

        puts "\n\nChecking for encryption for #{@user}. \n\n"
        puts "This script will only take a sec.\n\n "
        if File.exists?('encrypteddrive.txt')
          File.delete('encrypteddrive.txt')
        end
        linuxtest = Linuxtest.new(@user, @body)        
        Mail_it.new(linuxtest.user, linuxtest.body)
        File.delete('encrypteddrive.txt')
        puts "Check Complete\n\n"

      when /sunos|solaris/i
        # Solaris
      when /darwin/i

        puts "\n\nChecking for encryption for #{@user}. \n\n"
        puts "This script will only take a sec.\n\n "
        if File.exists?('diskutil.txt')
          File.delete('diskutil.txt')
        end
        mactest = Mactest.new(@user)
        Mail_it.new(mactest.user,mactest.body)
        File.delete('diskutil.txt')
        puts "Check Complete\n\n"

      else
        puts"error, find Dale"
    end
  end
end

Main.new
