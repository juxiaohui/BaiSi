//
//  XHNewViewController.m
//  BaiSiBuDeJie
//
//  Created by jxh on 2017/6/26.
//  Copyright © 2017年 JuXiaoHui. All rights reserved.
//

#import "XHNewViewController.h"
#import "UIBarButtonItem+XHExt.h"

@interface XHNewViewController ()

@end

@implementation XHNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
}

-(void)setupNav{
    
    self.view.backgroundColor = XHCommonBgColor;
    
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
}

-(void)tagClick{
    
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
