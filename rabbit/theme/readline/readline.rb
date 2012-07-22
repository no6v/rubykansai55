add_image_path("readline-images")

@syntax_highlighting_scheme = {
  :class => {
    :color => "#228b22",   # ForestGreen
  },
  :comment => {
    :color => "#b22222",   # firebrick
  },
  :comment_delimiter => {
    :color => "#b22222",   # firebrick
    :style => "italic",
  },
  :constant => {
    :color => "#228b22",   # ForestGreen
  },
  :keyword => {
    :color => "#a020f0",   # Purple
  },
  :method => {
    :color => "#0000ff",   # Blue1
  },
  :predefined_constant => {
    :color => "#a0522d",   # sienna
  },
  :string => {
    :color => "#8b2252",   # VioletRed4
  },
  :symbol => {
    :color => "#008b8b",   # dark cyan
  },
}

@slide_number_uninstall = true
include_theme("default")

background_image = "tab.jpg"
@title_slide_background_image = background_image
include_theme("title-slide-background-image")

flag_color = "red"
if canvas.allotted_time
  include_theme("image-slide-number")
  @image_slide_number_show_text = true
  @image_slide_number_start_flag_color = flag_color
  @image_slide_number_goal_flag_color = flag_color
  include_theme("image-timer")
end

include_theme("title-on-image-toolkit")

match(Slide) do |slides|
  slides.each do |slide|
    slide.title_on_image if slide.title_on_image?
  end
end

match(TitleSlide) do |slides|
  slides.prop_set("foreground", "white")
  slides.prop_set("size", 65000)
end

match("**", CustomTag) do |tags|
  tags.each do |tag|
    case tag.name
    when "blue"
      tag.prop_set("foreground", "Blue1")
    end
  end
end
