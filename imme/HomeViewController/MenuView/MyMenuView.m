//
//  MyMenuView.m
//  TestAnimation
//
//  Created by 王思源 on 14/10/30.
//  Copyright (c) 2014年 王思源. All rights reserved.
//

#import "MyMenuView.h"

#define BUTTONRASIUS 10//圆角
#define BUTTONRANGE 20//距离
#define BUTTONSIZEHEIGHT 60//按钮高度
#define BUTTONSIZEWIDTH 40//按钮宽度

#define UprightButHeight 50//菜单的高度

@implementation MyMenuView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    upView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, BUTTONSIZEHEIGHT + 10)];
    upView.backgroundColor = [UIColor clearColor];
    [self addSubview:upView];
    
    menuScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, upView.frame.size.height + 10, ScreenWidth, 350)];
    menuScroll.hidden = YES;
    menuScroll.contentSize = CGSizeMake(menuScroll.frame.size.width , menuScroll.frame.size.height + 100);
    [self addSubview:menuScroll];
    
    
    //创建最右上角的按钮
    _mainBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.bounds.size.width - BUTTONSIZEWIDTH - BUTTONRANGE, 10, BUTTONSIZEWIDTH, BUTTONSIZEHEIGHT)];
    [_mainBtn setBackgroundImage:[UIImage imageNamed:@"icon_bar_add_clock"] forState:UIControlStateNormal];
    [_mainBtn addTarget:self action:@selector(showAnimation:) forControlEvents:UIControlEventTouchUpInside];
    _mainBtn.layer.masksToBounds = YES;
    _mainBtn.layer.cornerRadius = BUTTONRASIUS;
    [upView addSubview:_mainBtn];
    
    menuAni = [[MenuBtnAnimation alloc]init];
    menuAni.mainBtn = _mainBtn;
    menuAni.menuScroll = menuScroll;
    
    //创建右上角按钮的动画
    cabasic = [MenuBtnAnimation showMainButtonAnimation];
    
    //创建最上面一条的按钮
    //self.bounds.size.width - _mainBtn.bounds.size.width - BUTTONRANGE
    _selectBtn = [self showUpMenuBtnWithImageName:@"icon_bar_add_clock"];
    _countBtn = [self showUpMenuBtnWithImageName:@"icon_bar_add_clock"];
    _addressBtn = [self showUpMenuBtnWithImageName:@"icon_bar_add_clock"];
    
    //创建竖着的菜单
    _upBtn1 = [self showMenuUprightBtnWithY:BUTTONRANGE];
    _upBtn2 = [self showMenuUprightBtnWithY:BUTTONRANGE * 2 + UprightButHeight];
    _upBtn3 = [self showMenuUprightBtnWithY:BUTTONRANGE * 3 + UprightButHeight * 2];
    _upBtn4 = [self showMenuUprightBtnWithY:BUTTONRANGE * 4 + UprightButHeight * 3];
    _upBtn5 = [self showMenuUprightBtnWithY:BUTTONRANGE * 5 + UprightButHeight * 4];
    
    return self;
}
-(void)showAnimation:(id)sender
{
    NSInteger arn = rand();
    NSLog(@"%ld",arn%10);
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"showMenuUprightBtn" object:nil];
    clickCount ++;
    CGFloat pi;
    if (clickCount % 2 == 0)
    {
        pi = -M_PI;
        [self deleteMenu];
    }
    else
    {
        pi = M_PI;
        [self showMenuView];
    }
    cabasic.toValue = [NSNumber numberWithFloat:pi];//结束角度
//    _mainBtn.layer.transform = CATransform3DRotate(_mainBtn.layer.transform, pi, 0, 0, 0);
    _mainBtn.transform = CGAffineTransformIdentity;
    [_mainBtn.layer addAnimation:cabasic forKey:nil];
}
//展示菜单栏
-(void)showMenuView
{
    menuScroll.hidden = NO;
    [menuAni showUpBtnAnimationWithBtn:_selectBtn andX:upView.bounds.size.width - _mainBtn.bounds.size.width*4 - BUTTONRANGE*3
                               andTime:0.5];
    [menuAni showUpBtnAnimationWithBtn:_countBtn andX:upView.bounds.size.width - _mainBtn.bounds.size.width*3 - BUTTONRANGE*2
                               andTime:0.4];
    [menuAni showUpBtnAnimationWithBtn:_addressBtn andX:upView.bounds.size.width - _mainBtn.bounds.size.width*2 - BUTTONRANGE
                               andTime:0.3];
    
    [MenuBtnAnimation showUprightScrollMenuWithView:_upBtn1 andY:BUTTONRANGE andTime:0.2];
    [MenuBtnAnimation showUprightScrollMenuWithView:_upBtn2 andY:BUTTONRANGE * 2 + UprightButHeight andTime:0.3];
    [MenuBtnAnimation showUprightScrollMenuWithView:_upBtn3 andY:BUTTONRANGE * 3 + UprightButHeight*2 andTime:0.4];
    [MenuBtnAnimation showUprightScrollMenuWithView:_upBtn4 andY:BUTTONRANGE * 4 + UprightButHeight*3 andTime:0.5];
    [MenuBtnAnimation showUprightScrollMenuWithView:_upBtn5 andY:BUTTONRANGE * 5 + UprightButHeight*4 andTime:0.6];
}
//回收菜单栏
-(void)deleteMenu
{
    [menuAni deleteUpBtnAnimationWithBtn:_selectBtn andX:upView.bounds.size.width - _mainBtn.bounds.size.width*4 - BUTTONRANGE*3 andTime:0.5];
    [menuAni deleteUpBtnAnimationWithBtn:_countBtn andX:upView.bounds.size.width - _mainBtn.bounds.size.width*3 - BUTTONRANGE*2  andTime:0.4];
    [menuAni deleteUpBtnAnimationWithBtn:_addressBtn andX:upView.bounds.size.width - _mainBtn.bounds.size.width*2 - BUTTONRANGE andTime:0.3];
    
    
    [menuAni deleteUprightScrollMenuWithView:_upBtn1 andY:0 andTime:0.2];
    [menuAni deleteUprightScrollMenuWithView:_upBtn2 andY:0 andTime:0.3];
    [menuAni deleteUprightScrollMenuWithView:_upBtn3 andY:0 andTime:0.4];
    [menuAni deleteUprightScrollMenuWithView:_upBtn4 andY:0 andTime:0.5];
    [menuAni deleteUprightScrollMenuWithView:_upBtn5 andY:0 andTime:0.6];
//    menuScroll.hidden = YES;
}

//创建最顶上的几个按钮
-(UIButton *)showUpMenuBtnWithImageName:(NSString *)imageName
{
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, _mainBtn.bounds.origin.y, BUTTONSIZEWIDTH, BUTTONSIZEHEIGHT)];
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn.alpha = 0;
    btn.center = _mainBtn.center;
    [upView addSubview:btn];
    return btn;
}
//创建竖着的几个菜单栏
-(MenuUprightViewBtn *)showMenuUprightBtnWithY:(NSInteger)y
{
    MenuUprightViewBtn *uprightBtn = [[MenuUprightViewBtn alloc]init];
    uprightBtn = [UtilTool loadViewOfClass:[MenuUprightViewBtn class]];
    uprightBtn.frame = CGRectMake(BUTTONRANGE, y, ScreenWidth - BUTTONRANGE * 2, UprightButHeight);
    uprightBtn.alpha = 0;
    uprightBtn.center = CGPointMake(ScreenWidth/2, 0);
    [menuScroll addSubview:uprightBtn];
    return uprightBtn;
}
@end
