class WeatherController < UIViewController
  def viewDidLoad
    @name_label = setup_label [[10, 10], [300, 50]], UIColor.orangeColor, Name
    @place_label = setup_label [[10, 80], [300, 50]], UIColor.yellowColor, Place
    @temp_label = setup_label [[10, 150], [300, 50]], UIColor.greenColor, Temperature
  end

  def setup_label frame, bgcolor, text
    label = UILabel.alloc.initWithFrame(frame)
    label.textColor = UIColor.darkGrayColor
    label.backgroundColor = bgcolor
    label.textAlignment = UITextAlignmentCenter
    label.text = text.to_s

    view.addSubview label
    label
  end
end