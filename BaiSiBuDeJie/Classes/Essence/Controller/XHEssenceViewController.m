//
//  XHEssenceViewController.m
//  BaiSiBuDeJie
//
//  Created by XH on 2017/6/26.
//  Copyright © 2017年 JuXiaoHui. All rights reserved.
//

#import "XHEssenceViewController.h"
#import "UIBarButtonItem+XHExt.h"

@interface XHEssenceViewController ()

@end

@implementation XHEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setupNav];
    
}

-(void)setupNav{
    
    self.view.backgroundColor = XHCommonBgColor;
    
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"nav_item_game_icon" highImage:@"nav_item_game_click_icon" target:self action:@selector(gameClick)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationButtonRandom" highImage:@"navigationButtonRandomClick" target:self action:@selector(randomClick)];
}

-(void)gameClick{
    
}

-(void)randomClick{
    
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
