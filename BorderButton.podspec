Pod::Spec.new do |s|
  s.name             = "BorderButton"
  s.version          = "0.1.0"
  s.summary          = "A short description of BorderButton."
  s.description      = <<-DESC

                       DESC
  s.homepage         = "http://EXAMPLE/NAME"
  s.license          = 'MIT'
  s.author           = { "Frank Michael Sanchez" => "orion1701@me.com" }
  s.source           = { :git => "http://EXAMPLE/NAME.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes'
end
