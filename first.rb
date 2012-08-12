require "./Device.rb"
require "./state_device.rb"
require "./numeric_device"
require "rubygems"
require "json"
require "pp"
#
# *  file: Tester.java
# *
# * This is a control file to test my code for the Junior Developer position at ProGauge.
# * This version has been ported (by hand) from Java to Ruby to demonstrate my skills in the
# ruby programming language.
# * @author Daniel Haro
# * @see Hash
# * @see Arrays
# * @see Time
# * @JSON
# *
class First

def initialize()

end

def runProgram(deviceArray)

  deviceHM = Hash.new()

   deviceArray.each do |e|
     if e.isCurrent()
       if !deviceHM.has_key?(e.getName)
          deviceHM.store(e.getName, e)

       else

       temp = deviceHM.fetch(e.getName)
       temp.accumulate(e)
       deviceHM.delete(temp.getName)
       deviceHM.store(temp.getName,temp)

       end

     end


end

  deviceArray.clear

  deviceHM.each do    |key,value|
    deviceArray.push(value)

  end

  deviceArray.sort! {|a,b| a.getName.downcase <=> b.getName.downcase}
  deviceArray
end

end


controller = First.new()
deviceArray = Array.new

deviceGenerator = StateDevice.new("Cooler1","on",6,6,11,1)
deviceArray.push(deviceGenerator)

deviceGenerator = StateDevice.new("Cooler1","off",6,6,12,1)
deviceArray.push(deviceGenerator)

deviceGenerator = StateDevice.new("Cooler1","on",6,6,12,0)
deviceArray.push(deviceGenerator)

deviceGenerator = NumericDevice.new("pump2",39.758,6,6,11,1)
deviceArray.push(deviceGenerator)

deviceGenerator = NumericDevice.new("pump2",109.758,6,6,11,1)
deviceArray.push(deviceGenerator)

deviceGenerator = NumericDevice.new("AWT3",29.758,6,6,11,1)
deviceArray.push(deviceGenerator)

deviceGenerator = NumericDevice.new("Exhaust1",3932.758,6,6,11,1)
deviceArray.push(deviceGenerator)

deviceArray = controller.runProgram(deviceArray)


    out = JSON.fast_generate(deviceArray)
    pp out
