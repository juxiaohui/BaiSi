//
//  XHFollowViewController.m
//  BaiSiBuDeJie
//
//  Created by jxh on 2017/6/26.
//  Copyright © 2017年 JuXiaoHui. All rights reserved.
//

#import "XHFollowViewController.h"
#import "UIBarButtonItem+XHExt.h"

@interface XHFollowViewController ()

@end

@implementation XHFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
}


-(void)setupNav{
    
    self.view.backgroundColor = XHCommonBgColor;

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(friendsRecommentClick)];
    
    self.navigationItem.title = @"我的关注";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"我的关注" style:UIBarButtonItemStylePlain target:self action:nil];
    
}

-(void)friendsRecommentClick{
    
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
