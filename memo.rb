require "csv"

puts "1(新規でメモを作成) 2(既存のメモを編集する)"

memo_type = gets.to_i

# 続きを書いていきましょう！（ifで条件分岐)

if memo_type == 1
  # 新規でメモを入力するとき
  puts "メモを入力してください"
  puts "入力が完了したらctrl + dを押してください"
  input = $stdin.read.split("\n")
  puts "次のメモが入力されました"
  p input
  
  CSV.open("memo.csv","w")do |csv|
    csv << input
  end
  
elsif memo_type == 2
  # 既存のメモを編集するとき
  p CSV.read("memo.csv")
  puts "メモを入力してください"
  puts "入力が完了したらctrl + dを押してください"
  input = $stdin.read.split("\n")
  puts "次のメモが入力されました"
  p input
  
  CSV.open("memo.csv","a")do |csv|
    csv << input
  end
  
else
  puts "1か2を入力してください"
end