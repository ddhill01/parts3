class ScreenshotController < ApplicationController
  require 'win32ole'
  require 'win32/screenshot'
  require 'mini_magick'
  
  def index
  end

  def capture
    shell = WIN32OLE.new('WScript.Shell')
    shell.SendKeys('%{TAB}')
    sleep(0.25)
    screenshot = Win32::Screenshot::Take.of(:foreground).write!('C:/Parts3/parts3/public/images/screenshot.png')
    render plain: "Screenshot"

    image = MiniMagick::Image.open('C:/Parts3/parts3/public/images/screenshot.png')
    image.crop ('2576X1316+0+100')
    image.write ('C:/Parts3/parts3/public/images/screenshot_crop.png')
    #image.resize '800x400' # or any other size you want
    #image.write 'C:/Parts3/screenshot_small.png'
  end
end
