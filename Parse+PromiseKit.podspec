Pod::Spec.new do |s|
  s.name        = 'Parse+PromiseKit'
  s.version     = '0.9.2'
  s.source      = { :git => 'https://github.com/hathway/Parse-PromiseKit.git', :tag => 'v' + s.version.to_s }
  s.summary     = 'A PromiseKit category for the Parse SDK.'

  s.description = <<-DESC
                  `Parse+PromiseKit` is a category that adds [PromiseKit](http://promisekit.org/) integration to the
                  [Parse SDK](https://parse.com/docs/ios_guide).

                  For example, `[object saveInBackground]` becomes `[object promiseSave]`.
                  DESC

  s.homepage    = 'https://github.com/hathway/Parse-PromiseKit'
  s.license     = 'Apache License, Version 2.0'


  s.authors          = { 'DJ Tarazona' => 'dj@wearehathway.com', 'HATHWAY' => 'hello@wearehathway.com' }
  s.social_media_url = 'https://twitter.com/weareHATHWAY'

  s.ios.deployment_target = '6.0'  # PromiseKit minimum supported iOS version
  s.osx.deployment_target = '10.7' # Parse-OSX-SDK minimum supported OS X version

  s.requires_arc = true
  s.source_files = 'PMKPFMacros.h'

  s.dependency 'PromiseKit/base'

  s.frameworks   = 'Foundation'

  s.default_subspec = 'Core'

  s.subspec 'Core' do |cs|
    cs.source_files        = 'Parse+PromiseKit.{h,m}'
    cs.public_header_files = 'Parse+PromiseKit.h'

    cs.ios.dependency 'Parse', '~> 1.3'
    cs.osx.dependency 'Parse-OSX', '~> 1.3'

    cs.ios.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/Parse"' }
    cs.osx.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/Parse-OSX"' }
  end

  s.subspec 'FacebookUtils' do |fs|
    fs.platform = :ios

    fs.source_files        = 'ParseFacebookUtils+PromiseKit.{h,m}'
    fs.public_header_files = 'ParseFacebookUtils+PromiseKit.h'

    fs.dependency 'ParseFacebookUtils', '~> 1.3'

    fs.ios.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/ParseFacebookUtils"' }
  end
end
