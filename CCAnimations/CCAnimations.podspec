Pod::Spec.new do |s|
  s.name         = "CCAnimations"
  s.version      = "0.0.1"
  s.summary      = "A set of UIView animations"

  s.description  = <<-DESC

                   DESC

  s.homepage     = "https://github.com/caiobzen/CCAnimations"
 
  s.license      = "MIT"

  s.author             = { "Carlos Corrêa" => "caiobzen@gmail.com" }
  s.social_media_url   = "http://twitter.com/caiobzen"

  s.ios.deployment_target = "9.0"
  s.requires_arc = true

  s.source       = { :git => https://github.com/caiobzen/CCAnimations.git", :tag => s.version }
  s.source_files  = "Source", "Source/*.swift"

 end
