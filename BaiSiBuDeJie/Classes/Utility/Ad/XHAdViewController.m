//
//  XHAdViewController.m
//  BaiSiBuDeJie
//
//  Created by jxh on 2017/7/13.
//  Copyright © 2017年 JuXiaoHui. All rights reserved.
//

#import "XHAdViewController.h"

@interface XHAdViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UIButton *skipBtn;
@end

@implementation XHAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.skipBtn setupCornerWithRadius:5.f];
}
- (IBAction)skipBtnClick:(UIButton *)sender {
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
