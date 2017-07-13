//
//  XHAdViewController.m
//  BaiSiBuDeJie
//
//  Created by jxh on 2017/7/13.
//  Copyright © 2017年 JuXiaoHui. All rights reserved.
//

#import "XHAdViewController.h"
#import "XHAdModel.h"
#import "XHTabBarController.h"

static NSString * const BSCode2 = @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam";

@interface XHAdViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UIButton *skipBtn;

@property (nonatomic,weak) UIImageView * adImageView;

@property (nonatomic,strong) XHAdModel * adModel;

@property (nonatomic,strong) dispatch_source_t timer;

@end

@implementation XHAdViewController

-(UIImageView *)adImageView{
    if (!_adImageView) {
        UIImageView * adImageView = [[UIImageView alloc]init];
        adImageView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(adImageViewClick)];
        [adImageView addGestureRecognizer:tap];
        [self.contentView addSubview:adImageView];
        _adImageView = adImageView;
    }
    return _adImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.skipBtn setupCornerWithRadius:5.f];
    
    [self loadAdData];
    
    [self startTimeGCD];
}

-(void)loadAdData{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    parameters[@"code2"] = BSCode2;
    
    [XHNetWorkRequest xh_getRequestWithUrl:@"http://mobads.baidu.com/cpro/ui/mads.php" isNeedCache:NO parameters:parameters successBlock:^(id response) {
        
        self.adModel = [XHAdModel mj_objectWithKeyValues:response[@"ad"][0]];
        
        [self showAdimageView];
      
        //[response writeToFile:@"/Users/jxh/Desktop/练手小项目/ad.plist" atomically:YES];
        
    } failureBlock:^(NSError *error) {
        
    } progress:nil];
}

-(void)showAdimageView{
    
    CGFloat h = ScreenWidth/self.adModel.w * self.adModel.h;
    
    self.adImageView.frame = CGRectMake(0, 0, ScreenWidth, h);
    
    [self.adImageView sd_setImageWithURL:[NSURL URLWithString:self.adModel.w_picurl]];
}

//使用GCD实现倒计时
- (void)startTimeGCD {
    //在block内部不可以修改外部变量,需要添加__block进行修饰
    //设置倒计时总时长
    __block int timeout = 5;
    //创建队列(全局并发队列)
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    self.timer = timer;
    
    dispatch_source_set_timer(timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(timer, ^{
        if(timeout <= 0){
            //倒计时结束，关闭
            dispatch_source_cancel(timer);
            //回到主线程更新UI
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
//                [self.btn setTitle:@"发送验证码" forState:UIControlStateNormal];
//                self.btn.userInteractionEnabled = YES;
                
                [UIView animateWithDuration:0.2 animations:^{
                    self.contentView.alpha = 0.3;
                } completion:^(BOOL finished) {
                    XHTabBarController * tabBarController = [[XHTabBarController alloc]init];
                    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarController;
                    
                }];
            });
        }else{
            
            dispatch_async(dispatch_get_main_queue(), ^{

                [self.skipBtn setTitle:[NSString stringWithFormat:@"%d 跳过",timeout] forState:UIControlStateNormal];
                
//                [self.btn setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
//                self.btn.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(timer);
}

- (IBAction)skipBtnClick:(UIButton *)sender {
    
    dispatch_source_cancel(self.timer);
    
    [UIView animateWithDuration:0.2 animations:^{
        self.contentView.alpha = 0.3;
    } completion:^(BOOL finished) {
        XHTabBarController * tabBarController = [[XHTabBarController alloc]init];
        [UIApplication sharedApplication].keyWindow.rootViewController = tabBarController;
    }];
}

//广告点击
-(void)adImageViewClick{
    
    BOOL canOpen = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:self.adModel.ori_curl]];
    
    if (canOpen)[[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.adModel.ori_curl]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    
    XHLogFunc
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
