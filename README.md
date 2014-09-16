Parse+PromiseKit
================
`Parse+PromiseKit` is a category that adds [PromiseKit](http://promisekit.org/) integration to the
[Parse SDK](https://parse.com/docs/ios_guide).

*Note: The API is subject to change until v1.0.*

Installation
------------
### Via CocoaPods
Add `pod 'Parse+PromiseKit'` to your Podfile.

The category for [PFFacebookUtils](https://parse.com/docs/ios/api/Classes/PFFacebookUtils.html) is available as a subspec.
Add `pod 'Parse+PromiseKit/FacebookUtils'` to your Podfile.

Usage
-----
Import `Parse+PromiseKit.h` or `ParseFacebookUtils+PromiseKit.h` as appropriate.

Method names prefix Parse's asynchronous method names with `promise` and remove `InBackground`, etc. Promises are fulfilled
with the same result signature as the appropriate completion block (with a few exceptions).

`[object saveInBackground]` becomes `[object promiseSave]`

`[user signUpInBackground]` becomes `[user promiseSignUp]`

```objc
[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
    if (error) {
        // handle error
    } else {
        // do something with objects
    }
}]
```
becomes
```objc
[query promiseFindObjects].then(^(NSArray *objects) {
    // do something with objects
}).catch(^(NSError *error) {
    // handle error
});
```

License
-------
`Parse+PromiseKit` is free software and is released under the [Apache v2](http://www.apache.org/licenses/LICENSE-2.0.html)
license. See [LICENSE](LICENSE) for more information.

Copyright &copy; 2014 Hathway Inc.
