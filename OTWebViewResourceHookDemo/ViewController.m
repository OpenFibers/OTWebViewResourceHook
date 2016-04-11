//
//  ViewController.m
//  OTWebViewResourceHookDemo
//
//  Created by openthread on 4/11/16.
//  Copyright © 2016 openthread. All rights reserved.
//

#import "ViewController.h"
#import "UIWebView+OTWebViewResourceHook.h"

@interface ViewController ()
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.webView setResourceRequestWillSendCallback:^(NSMutableURLRequest *request) {
        NSLog(@"%@", request.URL);
    }];
    [self.view addSubview:self.webView];
    
    [self loadRequest];
}

- (void)viewDidLayoutSubviews
{
    self.webView.frame = self.view.bounds;
}

- (void)loadRequest
{
    NSString *URLString = @"https://www.google.com";
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:URLString]];
    [self.webView loadRequest:request];
}

@end
