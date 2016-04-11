//
//  UIWebView+OTHack.m
//  CachedWebView
//
//  Created by openthread on 4/11/16.
//
//

#import "UIWebView+OTWebViewResourceHook.h"
#import <objc/runtime.h>

static char OTWebViewResourceHookResourceWillSendCallbackKey;

@implementation UIWebView (OTWebViewResourceHook)

- (void (^)(NSMutableURLRequest *))resourceRequestWillSendCallback
{
    id callback = objc_getAssociatedObject(self, &OTWebViewResourceHookResourceWillSendCallbackKey);
    return callback;
}

- (void)setResourceRequestWillSendCallback:(void (^)(NSMutableURLRequest *))resourceRequestWillSendCallback
{
    objc_setAssociatedObject(self, &OTWebViewResourceHookResourceWillSendCallbackKey, resourceRequestWillSendCallback, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

+ (void)load
{
    NSString *originalSELName = @"webThreadWebView:resource:willSendRequest:redirectResponse:fromDataSource:";
    NSString *newSELName = @"webThreadWebViewHack:resource:willSendRequest:redirectResponse:fromDataSource:";
    [self otHackSwizzle:self original:NSSelectorFromString(originalSELName) new:NSSelectorFromString(newSELName)];
}

- (NSMutableURLRequest *)webThreadWebViewHack:(id/*WebView * */)webThreadView resource:(id)resource willSendRequest:(NSMutableURLRequest *)request redirectResponse:(id)response fromDataSource:(id/*WebDataSource * */)dataSource
{
    NSMutableURLRequest *result = [self webThreadWebViewHack:webThreadView resource:resource willSendRequest:request redirectResponse:response fromDataSource:dataSource];
    if (self.resourceRequestWillSendCallback)
    {
        self.resourceRequestWillSendCallback(result);
    }
    return result;
}

+ (void)otHackSwizzle:(Class)c original:(SEL)orig new:(SEL) new
{
    Method origMethod = class_getInstanceMethod(c, orig);
    Method newMethod = class_getInstanceMethod(c, new);
    if (class_addMethod(c, orig, method_getImplementation(newMethod), method_getTypeEncoding(newMethod)))
    {
        class_replaceMethod(c, new, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }
    else
    {
        method_exchangeImplementations(origMethod, newMethod);
    }
}

@end
