//
//  XHTabBarController.m
//  BaiSiBuDeJie
//
//  Created by jxh on 2017/6/26.
//  Copyright © 2017年 JuXiaoHui. All rights reserved.
//

#import "XHTabBarController.h"
#import "XHNavigationController.h"
#import "XHMeTableViewController.h"
#import "XHEssenceViewController.h"
#import "XHNewViewController.h"
#import "XHFollowViewController.h"
#import "XHMeTableViewController.h"
#import "UIImage+XHExt.h"
#import "XHTabBar.h"


@interface XHTabBarController ()

@end

@implementation XHTabBarController


/**
 只会调用一次
 */
+(void)load{
}
    
/**
 1. 可能调用多次，(判断是当前类)
 + (void)initialize {
 if (self == [ClassName self]) {
 // ... do the initialization ...
 }
 }
 2. appearance 只能在显示之前设置
 */
+(void)initialize{

    if (self == [XHTabBarController class]) {
        
        NSMutableDictionary * normalDic = [NSMutableDictionary dictionary];
        
        normalDic[NSForegroundColorAttributeName] = [UIColor grayColor];
        
        normalDic[NSFontAttributeName] = XHNormalFont(12);
        
        NSMutableDictionary * selectlDic = [NSMutableDictionary dictionary];
        
        selectlDic[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
        
        UITabBarItem * tabBarItem = [UITabBarItem appearanceWhenContainedIn:self, nil];
        
        [tabBarItem setTitleTextAttributes:normalDic forState:UIControlStateNormal];
        
        [tabBarItem setTitleTextAttributes:selectlDic forState:UIControlStateSelected];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildController];
}

-(void)addChildController{
    
    [self setupChildVc:[[XHEssenceViewController alloc] init] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setupChildVc:[[XHNewViewController alloc] init] title:@"新帖" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    [self setupChildVc:[[XHFollowViewController alloc] init] title:@"关注" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    [self setupChildVc:[[XHMeTableViewController alloc] init] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
    [self setValue:[[XHTabBar alloc]init] forKey:@"tabBar"];
    
}
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    // 包装一个导航控制器
    XHNavigationController *nav = [[XHNavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];
    
    // 设置子控制器的tabBarItem
    nav.tabBarItem.title = title;
    
    nav.tabBarItem.image = [UIImage originalImageWithName:image];
    
    nav.tabBarItem.selectedImage = [UIImage originalImageWithName:selectedImage];
}

    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
