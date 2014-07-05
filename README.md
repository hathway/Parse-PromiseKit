Parse+PromiseKit
================
`Parse+PromiseKit` is a category that adds [PromiseKit](http://promisekit.org/) integration to the
[Parse SDK](https://parse.com/docs/ios_guide).

Usage
-----
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
`Parse+PromiseKit` is free software and is released under the [GPLv2](http://www.gnu.org/licenses/gpl-2.0.html) license.
See [LICENSE](LICENSE) for more information.

Copyright &copy; 2014 Hathway Inc.
