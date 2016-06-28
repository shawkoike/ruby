###############################################################################
##############　　クライアント側プログラム server.rb と使用　　　####################
################################################################################

require 'socket'

# host , PORT_NUMBER を定義
HOST = "localhost"
PORT_FOR_LOGIN = 12345
# localhost のポート番号 12345 に接続
sock = TCPSocket.open(HOST,PORT_FOR_LOGIN)

# ログイン
loop do
  print "ユーザ名　パスワード (新規登録はsign_upを入力): "
  input = STDIN.gets.chomp
  if input == "sign_up"
    loop do
      sock.puts input # サーバー側を新規登録に変更
      print "ユーザ名を入力してください："
      new_user = STDIN.gets.chomp
      sock.puts new_user # ユーザ名をサーバーに送信
      printf "パスワードを入力してください："
      new_user_pass = STDIN.gets.chomp
      sock.puts new_user_pass # パスワードをサーバーに送信
      result = sock.gets.chomp
      puts "新規ユーザ #{new_user} を登録しました。"
      break if result == "suc" # suc が返ってきたら新規登録成功
    end
  else
    # サーバーに入力文字列を渡す
    sock.puts input
    # サーバーからの返事を取得
    reply = sock.gets.chomp
    puts reply
    if reply == "success"
      break
    end
  end
end
# PORT_FOR_LOGIN のポートを閉じる
sock.close
sleep(0.7)
puts "新しいポートを開きます"
# 定数 PORT_NUMBER を定義
PORT_NUMBER = 23456
# localhost(自マシン)のポート番号 23456 をオープン
sk = TCPSocket.open(HOST,PORT_NUMBER)


# 入力
loop do
  print "送るメッセージ："
  line = STDIN.gets.chomp
  # ソケットに入力文字列を渡す
  sk.puts line
  break if line == "quit" # 終了処理
  sk.flush
end

# 接続を閉じる
sk.close
