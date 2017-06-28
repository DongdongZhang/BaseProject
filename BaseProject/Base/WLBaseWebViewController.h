//
//  WLBaseWebViewController.h
//  WaLanFlowerType
//
//  Created by 瓦栏 on 16/9/22.
//  Copyright © 2016年 瓦栏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface WLBaseWebViewController : UIViewController<WKNavigationDelegate, WKUIDelegate>

@property (nonatomic, copy) NSString *viewTitle;
@property (nonatomic, assign) NSInteger Id;
@property (nonatomic, strong) UIColor *progressViewColor;
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIView *progressView;
@property (nonatomic, strong) CADisplayLink *displayLink;

@property (nonatomic, copy) NSString *urlString;

@end
