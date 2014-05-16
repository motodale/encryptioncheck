

class Mactest

  attr_accessor :user
  attr_accessor :body



  def initialize(user)
    @body_ary = []
    @user = user
    check
  end
  def check

    file_create = "diskutil cs list >> diskutil.txt"
    text = `#{file_create}`

    file = File.open('diskutil.txt', 'r')

    File.readlines(file).each do |line|
      @body_ary.push(line) if (line[/Fully\sSecure/])
      @body_ary.push(line) if (line[/Passphrase\sRequired:/])
      @body_ary.push(line) if (line[/Revertible/])
    end

    if File.exists?'/Applications/ClamXav.app'
      @body_ary.push("ClamXav is on the Mac.")
    else
      @body_ary.push("ClamXav is NOT on the Mac.")
    end

    @body = "#{@user} has:" + @body_ary[0] + "\n" + @body_ary[1] + "\n" + @body_ary[2] + "\n" + @body_ary[3]
  end
end
