Pod::Spec.new do |s|
  s.name        = 'Parse+PromiseKit'
  s.version     = '0.9.3'
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

  s.default_subspec = 'Parse'

  s.subspec 'Base' do |bs|
    bs.source_files = 'PMKPFMacros.h'

    bs.dependency 'PromiseKit/base', '~> 1.5'

    bs.frameworks = 'Foundation'
  end

  s.subspec 'Parse' do |cs|
    cs.source_files        = 'Parse+PromiseKit.{h,m}'
    cs.public_header_files = 'Parse+PromiseKit.h'

    cs.dependency 'Parse+PromiseKit/Base'
    cs.ios.dependency 'Parse', '~> 1.7'
    cs.ios.dependency 'ParseUI', '~> 1.1.1'
    cs.osx.dependency 'Parse-OSX', '~> 1.7'

    cs.ios.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/Parse"' }
    cs.osx.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/Parse-OSX"' }
  end

  s.subspec 'FacebookUtils' do |fs|
    fs.platform = :ios

    fs.source_files        = 'ParseFacebookUtils+PromiseKit.{h,m}'
    fs.public_header_files = 'ParseFacebookUtils+PromiseKit.h'

    fs.dependency 'Parse+PromiseKit/Base'
    fs.dependency 'ParseFacebookUtils', '~> 1.3'

    fs.ios.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/ParseFacebookUtils"' }
  end
end
