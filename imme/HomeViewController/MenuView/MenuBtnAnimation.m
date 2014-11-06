//
//  MenuBtnAnimation.m
//  TestAnimation
//
//  Created by 王思源 on 14/10/30.
//  Copyright (c) 2014年 王思源. All rights reserved.
//

#import "MenuBtnAnimation.h"

@implementation MenuBtnAnimation

+(CABasicAnimation *)showMainButtonAnimation
{
   CABasicAnimation *cabasic = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    cabasic.duration = 0.3;//时长
    cabasic.repeatCount = 1;//次数
    cabasic.fromValue = [NSNumber numberWithFloat:0];//起始角度
    //设置这两个属性可以让view留在当前位置
    cabasic.removedOnCompletion = NO;
    cabasic.fillMode = kCAFillModeForwards;
    
    return cabasic;
}

//展出最顶上按钮的动画
-(void)showUpBtnAnimationWithBtn:(UIButton *)btn andX:(NSInteger)x andTime:(CGFloat)dur
{
    [UIView animateWithDuration:dur animations:^{
        btn.alpha = 1;
        btn.center = CGPointMake(x - 70, _mainBtn.frame.origin.y + btn.frame.size.height/2);
    }];
    
    [UIView animateWithDuration:dur + 0.3 animations:^{
        btn.center = CGPointMake(x, _mainBtn.frame.origin.y + btn.frame.size.height/2);
    }];
}
//回收按钮的动画
-(void)deleteUpBtnAnimationWithBtn:(UIButton *)btn andX:(NSInteger)x andTime:(CGFloat)dur
{
    [UIView animateWithDuration:dur - 0.7 animations:^{
        btn.alpha = 1;
        btn.center = CGPointMake(x - 40, _mainBtn.frame.origin.y + btn.frame.size.height/2);
    }];
    [UIView animateWithDuration:dur delay:dur - 0.2 options:UIViewAnimationOptionLayoutSubviews animations:^{
        btn.alpha = 0;
        btn.center = _mainBtn.center;
    } completion:^(BOOL finished) {
        
    }];
    
//    [UIView animateWithDuration:dur animations:^{
//        btn.alpha = 0;
//        btn.center = _mainBtn.center;
//    }];
}

+(void)showUprightScrollMenuWithView:(UIView *)view andY:(NSInteger)y andTime:(CGFloat)dur
{
    CGPoint viewPoint = view.center;
    [UIView animateWithDuration:dur animations:^{
        view.alpha = 1;
        view.center = CGPointMake(viewPoint.x, y);
    }];
}
-(void)deleteUprightScrollMenuWithView:(UIView *)view andY:(NSInteger)y andTime:(CGFloat)dur
{
    CGPoint viewPoint = view.center;
    [UIView animateWithDuration:dur animations:^{
        view.alpha = 0;
        view.center = CGPointMake(viewPoint.x, y);
    }];
    [self performSelector:@selector(hiddenScroll) withObject:nil afterDelay:dur + 0.1];
}
-(void)hiddenScroll
{
    _menuScroll.hidden = YES;
}
@end
