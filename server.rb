################################################################################
##############　　　サーバー側プログラム client.rb と使用　　　######################
################################################################################

require "socket"

port_number = 12345

# localhost(自マシン)のポート 12345 をオープン
con = TCPServer.open(port_number)
puts "waiting connect"

# 接続を受ける
receive = con.accept

# 受信したデータを表示
while data = receive.gets
  puts data
end

# 接続を閉じる
receive.close
con.close
