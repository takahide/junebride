class Job
  def self.read_names
    array = %w(細川幸子 近藤規一 近藤ふさ子 石垣孝継 藤井清司 藤井三栖子 小段了太 近藤絵美 加山孝太郎 加山恵美 北條健太 山口良介 森賢彰)
    array.each do |name|
      @guest = Guest.new
      @guest.name = name
      @guest.code = [*100000..999999].sample
      @guest.attendance = 0
      @guest.save
    end
  end
end
