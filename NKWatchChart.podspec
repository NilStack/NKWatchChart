
Pod::Spec.new do |s|

  s.name         = "NKWatchChart"
  s.version      = "0.1.0"
  s.summary      = "A chart library for Apple Watch based on PNChart."

  s.description  = <<-DESC
                   A chart library for Apple Watch based on PNChart. We support line, bar, pie, circle and radar charts.

                   DESC

  s.homepage     = "https://github.com/NilStack/NKWatchChart"
  s.screenshots  = "https://db.tt/d7pJD84m"
  s.license      = "MIT"
  s.author       = { "Peng Guo" => "guoleii@gmail.com" }
  s.social_media_url   = "http://twitter.com/NilStack"
  s.watchos.deployment_target = "2.0"
  s.source       = { :git => "https://github.com/NilStack/NKWatchChart.git", :tag => s.version.to_s }
  s.watchos.source_files  = "WatchChart Extension/NKWatchChart/*.{h,m}"
  s.frameworks = "UIKit", "WatchKit"
  s.requires_arc = true

end
