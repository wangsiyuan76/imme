//
//  MyMenuView.h
//  TestAnimation
//
//  Created by 王思源 on 14/10/30.
//  Copyright (c) 2014年 王思源. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuBtnAnimation.h"
#import "MenuUprightViewBtn.h"

@protocol MenuViewDelegate <NSObject>
-(void)clickHomeHeaderBtnDelegate:(UIButton *)btn;//顶部菜单按钮的点击代理
@end

@interface MyMenuView : UIView
{
    NSInteger clickCount;
    CABasicAnimation *cabasic;//旋转动画
    UIView *upView;//最顶上的view
    MenuBtnAnimation *menuAni;//按钮的动画
    UIScrollView *menuScroll;
    
    NSInteger _type;
}

@property (strong, nonatomic) NSArray *headerArr;

@property (strong, nonatomic) UIButton *mainBtn;
@property (assign, nonatomic) id<MenuViewDelegate> delegate;

//顶上横向的三个按钮
@property (strong, nonatomic) UIButton *countBtn;
@property (strong, nonatomic) UIButton *selectBtn;
@property (strong, nonatomic) UIButton *addressBtn;

//纵向的五个按钮
@property (strong, nonatomic) MenuUprightViewBtn *upBtn1;
@property (strong, nonatomic) MenuUprightViewBtn *upBtn2;
@property (strong, nonatomic) MenuUprightViewBtn *upBtn3;
@property (strong, nonatomic) MenuUprightViewBtn *upBtn4;
@property (strong, nonatomic) MenuUprightViewBtn *upBtn5;
-(instancetype)initWithFrame:(CGRect)frame andType:(NSInteger)type;
@end
