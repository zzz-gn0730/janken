def main
  loop do
    def choices
      separator  = "-------------------"
  
      select_hands = ["グウ", "チョキ", "パー"]
      select_hands.each_with_index {|select_hand, index|
        puts "#{index}: #{select_hand}"
      }
    
      player_hand = gets.to_i
      if player_hand != 0 && player_hand != 1 && player_hand != 2
        return puts "\n入力値が不正です。「0」「1」「2」の指定された数値を入力してください。\nゲームを続ける場合は「y」 ゲームを終了する場合は「n」を入力して下さい。"
      end

      puts separator
      opponent_hand = rand(select_hands.size)
      puts "あなた:#{select_hands[player_hand]} 相手:#{select_hands[opponent_hand]}"
      puts separator
    
      result_1 = (player_hand - opponent_hand + 3) % 3
      janken_result(result_1)
    end
    
    def janken_result(result_1)
      case result_1
      when 0
        puts "あいこで.."
        choices
      when 2
        puts "あなたの勝ちです! \n指を指す方向を決めて下さい! \nあっち向いて〜ホイ"
        indicate_direction(result_1)
      else
        puts "あなたの負けです! \n顔を向ける方向を決めて下さい! \nあっち向いて〜ホイ"
        indicate_direction(result_1)
      end
    end
    
    def indicate_direction(result_1)
      separator  = "-------------------"
      puts separator
    
      directions = ["上", "下", "左", "右"]
      directions.each_with_index {|direction, index|
      puts "#{index}: #{direction}"
      }
    
      player_direction = gets.to_i
      if player_direction != 0 && player_direction != 1 && player_direction != 2 && player_direction != 3
        return puts "入力値が不正です。「0」「1」「2」「3」の指定された数値を入力してください。\nゲームを続ける場合は「y」 ゲームを終了する場合は「n」を入力して下さい。"
      end

      opponent_direction = rand(directions.size)
      puts separator
    
      result_2 = (player_direction - opponent_direction + 4) % 4
      match_result(result_1, result_2)
    
      puts "あなた:#{directions[player_direction]} 相手:#{directions[opponent_direction]}"
      puts separator
    end
    
    def match_result(result_1, result_2)
      case result_2
      when 0
        if result_1 == 2
          puts "あなたの勝ちです!!"
        end
        if result_1 == 1
          puts "あなたの負けです!!"
        end
      when 1..3
        if result_1 == 2
          puts "勝負がつきませんでした。"
        end
        if result_1 == 1
          puts "勝負がつきませんでした。"
        end
      end
    end
    choices

    puts "\nもう一度プレイしますか? 「y/n」"
    play_again = gets.chomp.downcase
    puts "-------------------"
    break unless play_again == "y"

  end
end
main