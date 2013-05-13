file = File.open("tttinput.txt", "rb")
contents = file.read
array = contents.split
puzzles = array.shift.to_i

def winner(str)
  arr = str.split("")
  return false if arr.include?(".") || (arr.include?("X") && arr.include?("O"))
  return "X" if arr.include?("X") || (arr.include?("X") && arr.include?("T"))
  return "O" if arr.include?("O") || (arr.include?("O") && arr.include?("T"))
end

def game_complete?(puzzle)
  puzzle.join("").include?(".") ? false : true
end

def get_result(puzzle,i)
  puzzle.each do |row|
    if winner(row) != false
      return winner(row)
    end
  end
  0.upto(3) do |ind|
    colu = []
    puzzle.each do |row|
      colu << row[ind]
    end
    if winner(colu.join("")) != false
      return winner(colu.join(""))
    end
  end
  diag1 = "#{puzzle[0][0]}#{puzzle[1][1]}#{puzzle[2][2]}#{puzzle[3][3]}"
  diag2 = "#{puzzle[0][3]}#{puzzle[1][2]}#{puzzle[2][1]}#{puzzle[3][0]}"
  return winner(diag1) if winner(diag1) != false
  return winner(diag2) if winner(diag2) != false
  return game_complete?(puzzle)
end

array.each_slice(4).with_index do |puzzle, i|
  res = get_result(puzzle,i)
  if res == "O" || res == "X"
    puts "Case ##{i+1}: #{res} won" 
  elsif res == false
    puts "Case ##{i+1}: Game has not completed"
  else
    puts "Case ##{i+1}: Draw"
  end
end
