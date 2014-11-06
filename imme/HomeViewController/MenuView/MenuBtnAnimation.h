//
//  MenuBtnAnimation.h
//  TestAnimation
//
//  Created by 王思源 on 14/10/30.
//  Copyright (c) 2014年 王思源. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuBtnAnimation : NSObject

@property (strong, nonatomic) UIButton *mainBtn;
@property (strong, nonatomic) UIScrollView *menuScroll;

//顶上旋转按钮动画
+(CABasicAnimation *)showMainButtonAnimation;

//展出最顶上横向按钮的动画
-(void)showUpBtnAnimationWithBtn:(UIButton *)btn andX:(NSInteger)x andTime:(CGFloat)dur;

//回收横向按钮的动画
-(void)deleteUpBtnAnimationWithBtn:(UIButton *)btn andX:(NSInteger)x andTime:(CGFloat)dur
;
//回收纵向菜单的动画
-(void)deleteUprightScrollMenuWithView:(UIView *)view andY:(NSInteger)y andTime:(CGFloat)dur;

//展出纵向菜单的动画
+(void)showUprightScrollMenuWithView:(UIView *)view andY:(NSInteger)y andTime:(CGFloat)dur;

@end
