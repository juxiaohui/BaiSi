//
//  XHNavigationController.m
//  BaiSiBuDeJie
//
//  Created by XH on 2017/6/26.
//  Copyright © 2017年 JuXiaoHui. All rights reserved.
//

#import "XHNavigationController.h"

@interface XHNavigationController ()<UIGestureRecognizerDelegate>


@end

@implementation XHNavigationController


+(void)initialize{
    if (self == [XHNavigationController class]) {
        
        UIBarButtonItem * barButtonItem = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
        
        UINavigationBar * navigationBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
        
        
        // 设置Bar 的背景和标题属性
        [navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
        
        NSMutableDictionary *barAttrs = [NSMutableDictionary dictionary];
        
        barAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:18];
        
        barAttrs[NSForegroundColorAttributeName] = [UIColor colorWithWhite:0 alpha:0.7];
        
        [navigationBar setTitleTextAttributes:barAttrs];
        
        //返回按钮的颜色
        [navigationBar setTintColor:[UIColor colorWithWhite:0 alpha:0.7]];
        
        //把背景图和分割线图清空
        [[UINavigationBar appearance] setShadowImage:[UIImage new]];
        //[[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        
        // 设置Item的标题属性
        
        [barButtonItem setTintColor: [UIColor colorWithWhite:0 alpha:0.7]];
        
        
        NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
        
        itemAttrs[NSFontAttributeName] = XHNormalFont(17);
        
        itemAttrs[NSForegroundColorAttributeName] =  [UIColor colorWithWhite:0 alpha:0.7];
        
        [barButtonItem setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.interactivePopGestureRecognizer.enabled = NO;
    
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wundeclared-selector"
    
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    pan.delegate = self;
    
    [self.view addGestureRecognizer:pan];
    
    #pragma clang diagnostic pop
    
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count >= 1) {
        // 左上角的返回
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backButton sizeToFit];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        
        UIView * containView = [[UIView alloc]initWithFrame:backButton.bounds];
        [containView addSubview:backButton];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:containView];
        viewController.hidesBottomBarWhenPushed = YES; // 隐藏底部的工具条
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

#pragma mark - <UIGestureRecognizerDelegate>
/**
 * 每当用户触发[返回手势]时都会调用一次这个方法
 * 返回值:返回YES,手势有效; 返回NO,手势失效
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    return self.childViewControllers.count > 1;
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
