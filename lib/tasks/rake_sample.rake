namespace :publish do
    desc "指定した時刻からの経過時間を表示"
    task test: :environment do
      time_now = Time.current
      time = Time.local(2021,3,19,21,00,00)
      puts "#{((time_now - time)/60).to_i}分が経過しました"
    end
end
