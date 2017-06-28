//
//  AppDelegate.m
//  BaseProject
//
//  Created by 瓦栏 on 2017/6/28.
//  Copyright © 2017年 Qingshan. All rights reserved.
//

#import "AppDelegate.h"
#import "IQKeyboardManager.h"
#import "QSMainViewController.h"
#import "QSKindViewController.h"
#import "QSCartViewController.h"
#import "QSMineViewController.h"


@interface AppDelegate ()

@property (nonatomic, strong) CYLTabBarController *tabBarController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self setupAppearance];
    [self registerRootVC];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)setupAppearance{
    
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    
    [UIApplication sharedApplication].statusBarHidden = NO;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    [[UITabBar appearance] setBarTintColor:[UIColor colorWithWhite:0 alpha:0.1]];
    
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    
    //设置文字颜色
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12], NSForegroundColorAttributeName : kBasisGrayColor} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12], NSForegroundColorAttributeName : kBasisYellowColor} forState:UIControlStateSelected];
    
    
    
}
- (void)registerRootVC{

    self.window.rootViewController = self.tabBarController;
    
}
-(CYLTabBarController *)tabBarController{
    //
    //    if (_tabBarController == nil) {
    QSMainViewController *vc1 = [QSMainViewController new];
    QSKindViewController *vc2 = [QSKindViewController new];
    QSCartViewController *vc3 = [QSCartViewController new];
    QSMineViewController *vc4 = [QSMineViewController new];
    
    WLBaseNavigationController *nav1 = [[WLBaseNavigationController alloc]initWithRootViewController:vc1];
    WLBaseNavigationController *nav2 = [[WLBaseNavigationController alloc]initWithRootViewController:vc2];
    WLBaseNavigationController *nav3 = [[WLBaseNavigationController alloc]initWithRootViewController:vc3];
    WLBaseNavigationController *nav4 = [[WLBaseNavigationController alloc]initWithRootViewController:vc4];
    
    
    NSDictionary *dic1 = @{
                           CYLTabBarItemTitle : NSLocalizedString(@"WLHome", nil),
                           CYLTabBarItemImage : @"tab_home",
                           CYLTabBarItemSelectedImage : @"tab_home_Pre"
                           };
    NSDictionary *dic2 = @{
                           CYLTabBarItemTitle : NSLocalizedString(@"WLPattern", nil),
                           CYLTabBarItemImage : @"tab_filter",
                           CYLTabBarItemSelectedImage : @"tab_filter_Pre"
                           };
    NSDictionary *dic3 = @{
                           CYLTabBarItemTitle : NSLocalizedString(@"WLOrder", nil),
                           CYLTabBarItemImage : @"tab_cart",
                           CYLTabBarItemSelectedImage : @"tab_cart_Pre"
                           };
    
    NSDictionary *dic4 = @{
                           CYLTabBarItemTitle : NSLocalizedString(@"WLMine", nil),
                           CYLTabBarItemImage : @"tab_mine",
                           CYLTabBarItemSelectedImage : @"tab_mine_Pre"
                           };
    
    
    _tabBarController = [[CYLTabBarController alloc]initWithViewControllers:@[nav1,nav2,nav3,nav4] tabBarItemsAttributes:@[dic1,dic2,dic3,dic4]];
    
    
    //    }
    
    return _tabBarController;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
