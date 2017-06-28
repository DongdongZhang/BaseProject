//
//  WLBaseNavigationController.m
//  WaLanFlowerType
//
//  Created by 瓦栏 on 16/9/22.
//  Copyright © 2016年 瓦栏. All rights reserved.
//

#import "WLBaseNavigationController.h"

@interface WLBaseNavigationController ()

@end

@implementation WLBaseNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationBar.barStyle = UIBarStyleBlack;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self setNeedsStatusBarAppearanceUpdate];
}

+ (void)initialize
{
    [self setNavigationItemTheme];
    [self setNavigationBarTheme];
}


+ (void)setNavigationItemTheme
{
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    barItem.tintColor = [UIColor blackColor];
    NSMutableDictionary *textAttributes = [NSMutableDictionary dictionary];
    textAttributes[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:17];
    [barItem setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
}

+ (void)setNavigationBarTheme
{
    // 取出设置主题的对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    //    [navBar setBackgroundImage:[UIImage imageNamed:@"nav_BGimage"] forBarMetrics:UIBarMetricsDefault];
    
//    [navBar setBarTintColor:[UIColor colorWithHexString:@"2b2b2b"]];
    [navBar setBarTintColor:kBasisYellowColor];
//    navBar.translucent = NO;

    [navBar setShadowImage:[UIImage new]];
    // 设置导航栏标题颜色
    NSMutableDictionary *textAttributes = [NSMutableDictionary dictionary];
    textAttributes[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:17];
    [navBar setTitleTextAttributes:textAttributes];
    
    // 5.去除阴影
//    NSShadow *shadow = [[NSShadow alloc]init];
//    shadow.shadowOffset = CGSizeZero;
//    textAttributes[NSShadowAttributeName] = shadow;
}

- (void)popself
{
    [self.view endEditing:YES];
    
    [self popViewControllerAnimated:YES];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }else{
        viewController.hidesBottomBarWhenPushed = NO;
    }
    if (viewController.navigationItem.leftBarButtonItem == nil && [self.viewControllers count] > 0){
        
        
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"navigation_back"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigation_back"] forState:UIControlStateHighlighted];

        [button addTarget:self action:@selector(popself) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(0, 0, 40, 40);
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:button];
        button.tintColor = [UIColor whiteColor];
        viewController.navigationItem.backBarButtonItem = nil;
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]   initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace   target:nil action:nil];
        negativeSpacer.width = -20;
        viewController.navigationItem.leftBarButtonItems = @[negativeSpacer,backItem];
    }else{
        
    }
    self.interactivePopGestureRecognizer.delegate = (id)self;
    
    [super pushViewController:viewController animated:animated];
}
- (UIViewController *)childViewControllerForStatusBarStyle{
    
    return self.visibleViewController;
}
-(UIViewController *)childViewControllerForStatusBarHidden{
    return self.visibleViewController;
}
//-(UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}
@end
