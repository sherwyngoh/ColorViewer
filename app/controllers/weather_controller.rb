class WeatherController < UIViewController
  stylesheet :weather
  def viewDidLoad
    @name_label = setup_label [[10, 30], [300, 50]], "orange", "Name"
    @weather_label = setup_label [[10, 100], [300, 50]], "yellow", "Place"
    @temp_label = setup_label [[10, 170], [300, 50]], "green", "Temperature"

    # get_weather
  end

  def setup_label frame, bgcolor, text
    @label = UILabel.alloc.initWithFrame(frame)
    @label.textColor = 'dark_gray'.to_color
    @label.backgroundColor = bgcolor.to_color
    @label.textAlignment = UITextAlignmentCenter
    @label.text = text

    view.addSubview @label
    @label
  end

  def get_location
    BW::Location.get_once do |loc|
      get_weather loc.latitude, loc.longitude
    end
  end

  def get_weather 
    BW::HTTP.get("http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139") do |response|
      # puts response.inspect
      # puts response.methods
      # puts response.body.to_str
      update_weather response.body.to_str
    end
  end

  def update_weather json
    response = BW::JSON.parse(json)

    name = response['name']
    puts name
    weather = response['weather'][0]['description']
    puts weather
    temp = response['main']['temp'] - 273.15
    puts temp


    
    @name_label.text = name
    @weather_label.text = weather
    @temp_label.text = "%f.2" % temp
  end
end