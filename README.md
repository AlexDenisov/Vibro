### Vibro. Feel the network interaction

Vibrates your device whenever your app sends network request.

**For testing only**

#### Installation

Via CocoaPods:

```ruby
pod 'Vibro'
```

or

```ruby
pod 'VibroFramework'
```

if you prefer static frameworks.

You can install it manually by downloading [static framework](https://github.com/AlexDenisov/Vibro/releases/download/0.2.0/Vibro-0.2.0.zip)

After installation just register VBURLProtocol in your system:

```objc
#import <Vibro/Vibro.h>
///
[VBURLProtocol startHandling];
```

#### Kudos

[@AliSoftware](https://github.com/AliSoftware) and his [OHHTTPStubs](https://github.com/AliSoftware/OHHTTPStubs) for the workaround with NSURLSession.

#### License

Distributed under MIT license, see LICENSE file for details

#### Contacts

https://github.com/AlexDenisov

https://twitter.com/1101_debian

