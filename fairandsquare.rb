def palendrome?(num)
  num = num.to_i
  num = num.to_s
  return true if num.length == 1
  halflen = (num.length/2) - 1
  0.upto(halflen) do |x|
    # puts num[x]
    return false if num[x] != num[num.length-1]
  end
  true
end

def calcall
  $coolnums = []
  1.upto(10**10).with_index do |num|
    next if palendrome?(num) == false
    sqrt = Math.sqrt(num.to_f)
    next if num.to_f % sqrt != 0
    next if palendrome?(sqrt) == false
    $coolnums << num
  end
end
calcall

p $coolnums
File.open("fairandsquareinput.txt", "rb").each_line.with_index do |line,i|
  next if not line.include?(" ")
  start = line.partition(" ")[0]
  finish = line.partition(" ")[2]
  counter = 0
  start.upto(finish) do |x|
    counter += 1 if $coolnums.include?(x.to_i)
  end
end