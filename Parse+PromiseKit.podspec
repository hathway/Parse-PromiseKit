Pod::Spec.new do |s|
  s.name        = 'Parse+PromiseKit'
  s.version     = '0.9.0'
  s.source      = { :git => 'https://github.com/hathway/Parse-PromiseKit.git', :tag => 'v' + s.version.to_s }
  s.summary     = 'A PromiseKit category for the Parse SDK.'

  s.description = <<-DESC
                  `Parse+PromiseKit` is a category that adds [PromiseKit](http://promisekit.org/) integration to the
                  [Parse SDK](https://parse.com/docs/ios_guide).

                  For example, `[object saveInBackground]` becomes `[object promiseSave]`.
                  DESC

  s.homepage    = 'https://github.com/hathway/Parse-PromiseKit'
  s.license     = 'GPLv2'


  s.authors          = { 'DJ Tarazona' => 'dj@wearehathway.com', 'HATHWAY' => 'hello@wearehathway.com' }
  s.social_media_url = 'https://twitter.com/weareHATHWAY'

  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'

  s.requires_arc = true

  s.source_files = 'Parse+PromiseKit.{h,m}'

  s.dependency 'PromiseKit/base'
  s.dependency 'Parse', '~> 1.2'

  s.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/Parse"' }
end
