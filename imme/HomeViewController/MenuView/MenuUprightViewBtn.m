//
//  MenuUprightViewBtn.m
//  TestAnimation
//
//  Created by 王思源 on 14/10/31.
//  Copyright (c) 2014年 王思源. All rights reserved.
//

#import "MenuUprightViewBtn.h"

@implementation MenuUprightViewBtn
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    _titleBtn.layer.masksToBounds = YES;
    _titleBtn.layer.cornerRadius = 3;
    [_headBtn setBackgroundImage:[UIImage imageNamed:@"icon_bar_add_clock"] forState:UIControlStateNormal];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
