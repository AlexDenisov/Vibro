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

You can install it manually by downloading [static framework](https://github.com/AlexDenisov/Vibro/releases/download/0.1.0/Vibro-0.1.0.zip)

After installation just register VBURLProtocol in your system:

```objc
#import <Vibro/Vibro.h>
///
[NSURLProtocol registerClass:[VBURLProtocol class]];
```

#### License

Distributed under MIT license, see LICENSE file for details

#### Contacts

https://github.com/AlexDenisov

https://twitter.com/1101_debian

