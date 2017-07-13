//
//  XHTabBar.m
//  BaiSiBuDeJie
//
//  Created by XH on 2017/6/26.
//  Copyright © 2017年 JuXiaoHui. All rights reserved.
//

#import "XHTabBar.h"

@interface XHTabBar ()

@property (nonatomic,strong) UIButton * publishBtn;

@end

@implementation XHTabBar

-(UIButton *)publishBtn{
    if (!_publishBtn) {
        
        UIButton * publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishBtn sizeToFit];
        [publishBtn addTarget:self action:@selector(publishBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _publishBtn = publishBtn;

    }
    return _publishBtn;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
        [self addSubview:self.publishBtn];
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    NSInteger count = self.items.count;
    
    CGFloat btnW = self.xh_width / (count + 1);
    CGFloat btnH = self.xh_height;
    NSInteger index = 0;
    
    
    for (UIView * tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            if (index == 2) {
                
                index += 1;
            }
            
            tabBarButton.frame = CGRectMake(index * btnW, 0, btnW, btnH);
            
            index ++;
        }
    }
    self.publishBtn.center = CGPointMake(self.xh_width * 0.5, self.xh_height * 0.5);
}

-(void)publishBtnClick:(UIButton *)btn{

}
@end
