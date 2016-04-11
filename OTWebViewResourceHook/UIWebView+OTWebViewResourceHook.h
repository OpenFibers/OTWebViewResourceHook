//
//  UIWebView+OTHack.h
//  CachedWebView
//
//  Created by openthread on 4/11/16.
//
//

#import <UIKit/UIKit.h>

@interface UIWebView (OTWebViewResourceHook)

@property (nonatomic, copy) void(^resourceRequestWillSendCallback)(NSMutableURLRequest *request);

@end
