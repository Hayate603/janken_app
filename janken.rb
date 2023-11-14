def janken(select_number)
  if select_number == $random_number
    $janken_result = "引き分け"
    puts "あいこで..."
  elsif (select_number == 1 && $random_number == 2) || (select_number == 2 && $random_number == 3) || (select_number == 3 && $random_number == 1)
    $janken_result = "勝ち"
  elsif (select_number == 1 && $random_number == 3) || (select_number == 2 && $random_number == 1) || (select_number == 3 && $random_number == 2)
    $janken_result = "負け"
  elsif select_number == 4
    puts "あなたは戦いを放棄しました。"
    exit
  end
end

def acchimuitehoi(select_number)
  if $janken_result == "勝ち" && select_number == $random_number
    puts "あなたの勝ちです"
    exit
  elsif $janken_result == "負け" && select_number == $random_number
    puts "あなたの負けです"
    exit
  elsif select_number != $random_number
    return
  end
end


hand_types = ["グー","チョキ","パー"]
directions = ["上","下","左","右"]
$janken_result = "引き分け"
$select_number = 0
$random_number = 0

while true
  puts "じゃんけん..."
  
  while $janken_result == "引き分け"
    puts "1（グー）2（チョキ）3（パー）4（戦わない）"
    $select_number = gets.chomp.to_i
    while !($select_number == 1 || $select_number == 2 || $select_number == 3 || $select_number == 4)
      puts "1、2、3、4のいずれかを入力してください。"
      $select_number = gets.chomp.to_i
    end
    $random_number = rand(1..3)
    puts "ホイ！"
    puts "_______________________"
    puts "あなた：#{hand_types[$select_number - 1]}を出しました"
    puts "相手：#{hand_types[$random_number - 1]}を出しました"
    puts "_______________________"
    janken($select_number)
  end

  puts "あっち向いて〜"
  puts "1(上)2(下)3(左)4(右)"
  $select_number = gets.chomp.to_i
  while !($select_number == 1 || $select_number == 2 || $select_number == 3 || $select_number == 4)
    puts "1、2、3、4のいずれかを入力してください。"
    $select_number = gets.chomp.to_i
  end
  $random_number = rand(1..4)
  puts "ホイ！"
  puts "_______________________"
  puts "あなた：#{directions[$select_number - 1]}"
  puts "相手：#{directions[$random_number - 1]}"
  puts "_______________________"
  acchimuitehoi($select_number)
  $janken_result = "引き分け"
end