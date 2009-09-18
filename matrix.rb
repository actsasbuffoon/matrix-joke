16# Test016

class Array
  
  def random
    self[rand(self.length)]
  end
  
end

class Test016 < Processing::App

  #load_library 'video'
  #import 'processing.video'

  def setup
    size(400, 300, P3D)
    frame_rate(30)
    @frms = 0
    
    #@mm = MovieMaker.new(self, width, height, "matrix.mov", 30, MovieMaker::H263, MovieMaker::HIGH)
    
    no_stroke
    
    text_font(load_font("Univers66.vlw.gz"), 12.0)
    @chars = ["0", "1"]
    @nums = []
    
    2000.times do
      @nums << {:char => @chars.random, :x => rand(width / 10) * 10, :y => -100, :spd => rand(100) / 20.0 + 2, :alpha => rand(100) + 155}
    end
  end
  
  def draw
    background(0)
    @nums.each do |num|
      num[:y] += num[:spd]
      if num[:y] > height + 10 then
        num[:y] = -100
        num[:x] = rand(width / 10) * 10
        num[:spd] = rand(50) / 10.0 + 2
        num[:alpha] = rand(100) + 155
      end
      if rand(4) == 0 then
        num[:char] = @chars.random
      end 
      num[:alpha] += rand(30) - 16
      num[:alpha] = 50 if num[:alpha] < 50
      fill(color(0, 255, 0, num[:alpha]))
      text(num[:char], num[:x], num[:y])
    end
    #@frms += 1
    #puts @frms if @frms % 50 == 0
    #@mm.add_frame
    #if @frms >= 300 then
    #  @mm.finish
    #  exit
    #end
  end
  
end

Test016.new :title => "Test016", :width => 400, :height => 300