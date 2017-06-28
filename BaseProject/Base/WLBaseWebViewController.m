//
//  WLBaseWebViewController.m
//  WaLanFlowerType
//
//  Created by 瓦栏 on 16/9/22.
//  Copyright © 2016年 瓦栏. All rights reserved.
//

#import "WLBaseWebViewController.h"

@interface WLBaseWebViewController ()

@end

@implementation WLBaseWebViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.viewTitle;
    [self setupWebView];
    
    NSURL *url = [NSURL URLWithString:self.urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}


- (UIView *)progressView
{
    if (!_progressView) {
        _progressView = [[UIView alloc]initWithFrame:CGRectZero];
        _progressView.mj_y = kNavigationBarHeight;
        _progressView.height = 2.0;
        _progressView.backgroundColor = kButtonNomalColor;
    }
    return _progressView;
}

- (void)setProgressViewColor:(UIColor *)progressViewColor {
    _progressViewColor = progressViewColor;
    self.progressView.backgroundColor = progressViewColor;
}

- (void)progressValueMonitor
{
    [self.view addSubview:self.progressView];
    self.progressView.width = kUIScreenWidth * self.webView.estimatedProgress;
}

- (void)setupWebView
{
    WKWebView *webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
//    webView.backgroundColor = kGlobalBg;
    webView.navigationDelegate = self;
    [self.view addSubview:webView];
    self.webView = webView;
}

#pragma mark - WKNavigationDelegate
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(progressValueMonitor)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    [self.displayLink invalidate];
    [UIView animateWithDuration:0.2 animations:^{
        self.progressView.width = kUIScreenWidth;
    } completion:^(BOOL finished) {
        [self.progressView removeFromSuperview];
    }];
}

// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [UIView animateWithDuration:0.2 animations:^{
        self.progressView.width = kUIScreenWidth;
    } completion:^(BOOL finished) {
        [self.progressView removeFromSuperview];
    }];
    [self.displayLink invalidate];
    if([error code] == NSURLErrorCancelled) return;
    [MBProgressHUD showError:@"网络不给力" toView:self.view];
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [UIView animateWithDuration:0.2 animations:^{
        self.progressView.width = kUIScreenWidth;
    } completion:^(BOOL finished) {
        [self.progressView removeFromSuperview];
    }];
    [self.displayLink invalidate];
    if([error code] == NSURLErrorCancelled) return;
    [MBProgressHUD showError:@"网络不给力" toView:self.view];
}



@end
