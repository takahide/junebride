class Job
  def self.read_names
    array = %w(細川幸郎 細川美保 小段真代 細川幸子 近藤規一 近藤ふさ子 石垣孝継 藤井清司 藤井三栖子 小段了太 近藤絵美 加山孝太郎 加山恵美 北條健太 山口良介 森賢彰 久野祐揮 夏目和樹 土橋萌 相川拓也 須田洋文 正田英之 南祐貴 西村顕一 坂本慧 羽根田竜樹 中畑虎也 中村昌史 中村将太 Co.慶応 石川貴之 田中健介 坂上順子 道場光代 道場秀三郎 神谷慶 鈴木未央 高宮紀子 矢ノ目亮 藤井亮助 今国智章 熊野皓祐 高谷優樹 三森亮 浅井晴香 久保裕明 矢澤尚之 宇治原彩 木下慶彦 米本秀高 山田浩司 大塩佑 大塩阿有美 西川滋 PatrickSchneider RobinSchneider 落合徹 伊藤健介 加藤雄也 GrahamDavis MicaelanDavis 吉田豊 吉田美智代 吉田瞬 吉田沙樹 中谷修 崗﨑典夫 吉田勝 角木喜代子 三宅美保子 三宅喜之  東川芽依 鈴木花織 木津まどか 田中佑加子 藤澤佳奈 首藤さゆり 小牧美沙 児玉昌 山田優里 前田智宏 小中愛子 小南和也 伊達学 膽畑匡志 藤本健治 高尾彩 鈴木夏菜 浅川真穂 木全英揮 安達七恵 石川大紀 赤羽雅也 村田詩織 前村直希 川崎彩 神木洋人 越久敬人 舟橋大樹 高橋聡 小野塚智武 村瀬有香)
    array.each do |name|
      @guest = Guest.new
      @guest.name = name
      @guest.code = [*100000..999999].sample
      @guest.attendance = 0
      @guest.save
    end
  end

  def self.remove_eight
    @guests = Guest.all
    @guests.each do |g|
      s = g.code.to_s
      new = ""
      s.chars do |c|
        if c == "8"
          new = new + rand(1..7).to_s
        else
          new = new + c
        end
      end
      g.code = new.to_i
      g.save
    end
  end

  def self.insert_eight
    @guests = Guest.all
    @guests.each do |g|
      index = g.id % 6
      s = g.code.to_s
      s[index] = "8"
      g.code = s.to_i
      g.save
    end
  end
end
