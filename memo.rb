require "csv" #sample.csvを読み込む

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.chomp.to_s #gets.chompメソッドはキーボードで入力した文字列の改行を消して取得

if memo_type == "1"
  puts "拡張子を除いたファイルを入力してください" 
  file_name = gets.chomp

  puts "メモしたい内容を記入してください"
  puts "完了したらCtrl＋Dを入力してください"
  input = STDIN.read 

  csv = CSV.open("#{file_name}.csv","w") #"w"は新規作成・上書き
    csv.puts ["#{input}"]
  csv.close
elsif memo_type == "2"
  puts "編集したいファイル名を入力してください" 
  file_name = gets.chomp

  puts "編集したい内容を入力してください"
  puts "完了したらCtrl＋Dを押します"
  input = STDIN.read

  csv = CSV.open("#{file_name}.csv","a") #"a"は編集
    csv.puts ["#{input}"]
  csv.close  
else
    puts "1または2を入力してください。"
end