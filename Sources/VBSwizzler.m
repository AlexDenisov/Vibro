//
//  VBSwizzler.m
//  Vibro
//
//  Created by AlexDenisov on 26/11/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

//
// Kudos to @AliSoftware
// https://github.com/AliSoftware/OHHTTPStubs/blob/3ada50896100911d25c500e5cf357636d2f5782a/OHHTTPStubs/Sources/OHHTTPStubs%2BNSURLSessionConfiguration.m
//

#import "VBURLProtocol.h"

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

typedef NSURLSessionConfiguration*(*SessionConfigConstructor)(id,SEL);
static SessionConfigConstructor orig_defaultSessionConfiguration;
static SessionConfigConstructor orig_ephemeralSessionConfiguration;

static SessionConfigConstructor VibroSwizzle(SEL selector, SessionConfigConstructor newImpl)
{
    Class cls = NSURLSessionConfiguration.class;
    Class metaClass = object_getClass(cls);
    
    Method origMethod = class_getClassMethod(cls, selector);
    SessionConfigConstructor origImpl = (SessionConfigConstructor)method_getImplementation(origMethod);
    if (!class_addMethod(metaClass, selector, (IMP)newImpl, method_getTypeEncoding(origMethod)))
    {
        method_setImplementation(origMethod, (IMP)newImpl);
    }
    return origImpl;
}

static void Vibro_InjectIntoConfiguration(NSURLSessionConfiguration* config) {
    NSMutableArray *protocols = config.protocolClasses.mutableCopy ?: [NSMutableArray new];
    [protocols insertObject:[VBURLProtocol class] atIndex:0];
    config.protocolClasses = protocols;
}

static NSURLSessionConfiguration* Vibro_defaultSessionConfiguration(id self, SEL _cmd)
{
    NSURLSessionConfiguration* config = orig_defaultSessionConfiguration(self,_cmd); // call original method
    Vibro_InjectIntoConfiguration(config);
    return config;
}

static NSURLSessionConfiguration* Vibro_ephemeralSessionConfiguration(id self, SEL _cmd)
{
    NSURLSessionConfiguration* config = orig_ephemeralSessionConfiguration(self,_cmd); // call original method
    Vibro_InjectIntoConfiguration(config);
    return config;
}

@interface NSURLSessionConfiguration(Vibro_Support) @end
@implementation NSURLSessionConfiguration(Vibro_Support)
+(void)load
{
    orig_defaultSessionConfiguration = VibroSwizzle(@selector(defaultSessionConfiguration),
                                                          Vibro_defaultSessionConfiguration);
    orig_ephemeralSessionConfiguration = VibroSwizzle(@selector(ephemeralSessionConfiguration),
                                                            Vibro_ephemeralSessionConfiguration);
}
@end
