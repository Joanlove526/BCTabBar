//
//  BaseTabBarViewController.m
//  企信通
//
//  Created by 林柏参 on 14/7/31.
//  Copyright (c) 2014年 林柏参. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "BaseNavigationController.h"
#import "BaseTabBar.h"

@interface BaseTabBarViewController ()<BaseTabBarDelegate>
/**
 *  自定义的tabbar
 */
@property (nonatomic, weak) BaseTabBar *customTabBar;

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 初始化tabbar
    [self setupTabbar];
    
    // 初始化所有的子控制器
    [self setupAllChildViewControllers];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

/**
 *  初始化tabbar
 */
- (void)setupTabbar
{
    BaseTabBar *customTabBar = [[BaseTabBar alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

/**
 *  监听tabbar按钮的改变
 *  @param from   原来选中的位置
 *  @param to     最新选中的位置
 */
- (void)tabBar:(BaseTabBar *)tabBar didSelectedButtonFrom:(NSUInteger)from to:(NSUInteger)to
{
    self.selectedIndex = to;
}

/**
 *  初始化所有的子控制器
 */
- (void)setupAllChildViewControllers
{
#warning 只需要在这里自定义控制器加入即可
    UIViewController *home = [[UIViewController alloc] init];
    [self setupChildViewController:home title:@"第一个" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    UIViewController *message = [[UIViewController alloc] init];
    [self setupChildViewController:message title:@"第二个" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
    UIViewController *discover = [[UIViewController alloc] init];
    [self setupChildViewController:discover title:@"第三个" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    UIViewController *me = [[UIViewController alloc] init];
    [self setupChildViewController:me title:@"第四个" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
}

/**
 *  初始化一个子控制器
 *
 *  @param childVc           需要初始化的子控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置控制器的属性
    childVc.title = title;
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageWithName:selectedImageName];
    if (iOS7) {
        childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else {
        childVc.tabBarItem.selectedImage = selectedImage;
    }
    
    // 2.包装一个导航控制器
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    // 3.添加tabbar内部的按钮
    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
}


@end
