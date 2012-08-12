class StateDevice     < Device
  # To change this template use File | Settings | File Templates.


  attr_reader :tagName
  attr_reader :data
  attr_reader :month
  attr_reader :day
  attr_reader :hour
  attr_reader :am_pm


  def initialize  (tagName,data,month,day,hour,am_pm)
    @tagName = tagName
    @data = data
    @month = month
    @day = day
    @hour = hour
    @am_pm = am_pm
  end

  def accumulate(merge)
    @data = @data + "\\n" + merge.data
  end

  def to_s
    @tagName + " " + @data
  end

  def getName
    @tagName
  end

end