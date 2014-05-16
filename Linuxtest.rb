 #/var/spool/cron/crontabs


class Linuxtest
  def initialize(user, body)
    @user = user
    @body = body
    sudome
    check
    `exit`
  end

  def sudome
    exec("sudo su")
  end

  def check
    file_create = "dmsetup status >> encrypteddrive.txt"
    `#{file_create}`
    `exit`
    file = File.open('encrypteddrive.txt', 'r')

    File.readlines(file).each do |line|
      @body_ary.push(line) if (line[/crypt$/])
    end

    @body = "#{@user} has:" + @body_ary[0] + "encrypted drive."
  end
end
