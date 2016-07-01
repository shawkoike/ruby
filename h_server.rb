###############################################################################
##############　　クライアント側プログラム client.rb と使用　　　####################
################################################################################

require 'socket'

class LoginCertifyError < StandardError; end
class LoginUserKnownError < StandardError; end
# HashVariable user for login
# key:username , value:password
$user = {"testuser"=>"test"}
port_number = 12345
port_num = 23456

def login(username,password)
  raise LoginCertifyError unless $user[username] == password
  raise LoginUserUnknownError unless $user[username]
  return true
end

# open the port
con = TCPServer.open(port_number)
puts "waiting connect・・・"
# receive connect
receive = con.accept

while data = receive.gets.chomp
  if data == "sign_up"
    name = receive.gets.chomp
    pass = receive.gets.chomp
    $user[name] = pass
    puts "sign_up name:#{name}  password:#{pass}"
    receive.puts "suc"
    next
  else
    arr = data.split(" ")
    if arr.size > 2 || arr.size <= 1
      puts "Incorrect input"
      server.puts "Incorrect input"
    else
      begin
        login(arr[0].to_s,arr[1].to_s)
        puts "login success"
        receive.puts "success"
        break
      rescue LoginCertifyError => ce
        puts ce
        receive.puts "Incorrect password"
      rescue LoginUserUnKnownError => um
        puts um
        server.puts "not find user"
      end
    end
  end
end

# close receive
receive.close
puts "close port and change"
re = TCPServer.open(port_num)
n = re.accept

while data = n.gets.chomp
  if data == "exit"
    break
  end
  `say #{data}`
  length = data.size
  0.upto(length-1) do |i|
    STDERR.print "\r" + " "*(length-1-i) + data[0..i] + " "
    sleep(0.05)
  end
  print "\n"
end

# close
n.close
