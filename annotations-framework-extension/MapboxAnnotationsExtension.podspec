Pod::Spec.new do |s|


  s.name         = "MapboxAnnotationsExtension"
  s.version      = "0.0.1-alpha.1"

  s.summary      = "Extension to support Mapbox's runtime styling annotations api."
  s.description  = "Provides an object oriented annotation api around runtime styling."
  s.homepage     = "http://www.mapbox.com/"
  # s.screenshots  = ""
  s.license      = { :type => 'Mapbox Terms of Service' }
  s.authors      = { 'Mapbox' => 'mobile@mapbox.com' }
  s.social_media_url   = "http://twitter.com/mapbox"

  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/mapbox/map-extensions-ios.git", :tag => "#{s.version}" }
  s.source_files  = "MapboxAnnotationsExtension", "MapboxAnnotationsExtension/Annotations/*.{h,m}", "MapboxAnnotationsExtension/Controllers/*.{h,m}", "MapboxAnnotationsExtension/Categories/*.{h,m}"
  s.dependency "Mapbox-iOS-SDK"

end
