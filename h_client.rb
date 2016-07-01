###############################################################################
##############　　クライアント側プログラム server.rb と使用　　　####################
################################################################################

require 'socket'

HOST = "localhost"
PORT_FOR_LOGIN = 12345
PORT_NUMBER = 23456

# connect
sock = TCPSocket.open(HOST,PORT_FOR_LOGIN)

# login => Enter username and password separated by a space
loop do
  print "username　password (Enter : sign_up): "
  input = STDIN.gets.chomp
  if input == "sign_up"
    loop do
      sock.puts input # send the sing_up symbol to server program
      print "username："
      new_user = STDIN.gets.chomp
      sock.puts new_user # send the username to server program
      printf "password："
      new_user_pass = STDIN.gets.chomp
      sock.puts new_user_pass # send the password to program
      result = sock.gets.chomp
      puts "success sing_up as #{new_user}"
      break if result == "suc"
    end
  else
    # send input to server program
    sock.puts input
    # receive reply
    reply = sock.gets.chomp
    puts reply
    if reply == "success"
      break
    else
      next
    end
  end
end

# close PORT_FOR_LOGIN
sock.close
sleep(0.7)
puts "open new port"
# connect port
sk = TCPSocket.open(HOST,PORT_NUMBER)

# input
loop do
  print "message?(to quit enter exit)： "
  line = STDIN.gets.chomp
  # send input
  sk.puts line
  break if line == "exit"
  sk.flush
end

# close
sk.close
