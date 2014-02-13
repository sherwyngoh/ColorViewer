Teacup::Stylesheet.new :weather do
  style :bottom_button,
    origin: [200, 50],
    title: 'Hi!'
  layout do
    subview(UIButton, :bottom_button)
  end
end