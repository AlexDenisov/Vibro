//
// Created by AlexDenisov on 25/11/14.
// Copyright (c) 2014 AlexDenisov. All rights reserved.
//

#import "VBURLProtocol.h"
#import <AudioToolbox/AudioToolbox.h>

static NSString *const kVBURLProtocolKey = @"kVBURLProtocolKey";
static NSString *const kVBURLProtocolProperty = @"kVBURLProtocolProperty";
static BOOL kVBURLHandlingEnabled = NO;

@interface VBURLProtocol ()
    <NSURLConnectionDataDelegate,
    NSURLConnectionDelegate>

@property (nonatomic, strong) NSURLConnection *connection;

@end

@implementation VBURLProtocol

+ (void)startHandling {
    kVBURLHandlingEnabled = YES;
    [NSURLProtocol registerClass:self];
}

+ (BOOL)canInitWithRequest:(NSURLRequest *)request {
    if (!kVBURLHandlingEnabled) {
        return NO;
    }
    
    NSString *property = [self propertyForKey:kVBURLProtocolKey inRequest:request];
    if ([property isEqual:kVBURLProtocolProperty]) {
        return NO;
    }
    
    return YES;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
    return request;
}

- (void)startLoading {
    NSMutableURLRequest *mutableRequest = [self.request mutableCopy];
    [[self class] setProperty:kVBURLProtocolProperty
                       forKey:kVBURLProtocolKey
                    inRequest:mutableRequest];
    self.connection = [NSURLConnection connectionWithRequest:mutableRequest delegate:self];
    [self notify];
}

- (void)stopLoading {
    [self.connection cancel];
}

- (void)notify {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

#pragma mark - NSURLConnection delegate

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.client URLProtocol:self didLoadData:data];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.client URLProtocol:self
          didReceiveResponse:response
          cacheStoragePolicy:NSURLCacheStorageAllowed];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [self.client URLProtocol:self didFailWithError:error];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [self.client URLProtocolDidFinishLoading:self];
}

@end
