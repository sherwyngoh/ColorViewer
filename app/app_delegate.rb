class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    puts "Hello!  You just launched: #{App.name}, \n location: (#{App.documents_path})"
    
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    
    @window.backgroundColor = UIColor.lightGrayColor
    @window.rootViewController = WeatherController.alloc.init
    @window.makeKeyAndVisible

    true
  end
end