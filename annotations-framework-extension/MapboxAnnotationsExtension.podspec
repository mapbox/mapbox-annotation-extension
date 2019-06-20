Pod::Spec.new do |s|


  s.name         = "MapboxAnnotationsExtension"
  s.version      = "0.0.1"
  s.summary      = "Extension to support runtime styling annotations."


  s.description  = "Provides object oriented annotation objects around runtime styling."

  s.homepage     = "http://www.mapbox.com/"
  # s.screenshots  = ""


  s.license      = "TBD"

  s.authors             = "Mapbox"
  s.social_media_url   = "http://twitter.com/mapbox"

  s.platform     = :ios, "9.0"

  s.source       = { :git => "", :tag => "#{s.version}" }
  s.source_files  = ""
  s.dependency "Mapbox-iOS-SDK"

end
