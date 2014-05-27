Pod::Spec.new do |s|
  s.name             = "BorderButton"
  s.version          = "0.1.0"
  s.summary          = "Subclass of UIButton that gives a colored border around a UIButton."
  s.description      = <<-DESC
                        Subclass of UIButton that gives a colored border around a UIButton. The subclass takes the textColor attribute and creates a border with that color. When a user presses the button, it will change to be filled with the border color creating a solid color button.
                       DESC
  s.homepage         = "https://github.com/fmscode/BorderButton"
  s.license          = 'MIT'
  s.author           = { "Frank Michael Sanchez" => "orion1701@me.com" }
  s.source           = { :git => "https://github.com/fmscode/BorderButton.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes'
end
