//
//  PublishViewController.m
//  imme
//
//  Created by 王思源 on 14/11/8.
//  Copyright (c) 2014年 immeWithDouBi. All rights reserved.
//

#import "PublishViewController.h"
@interface PublishViewController ()

@end

@implementation PublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_textFiled becomeFirstResponder];
    
    MyMenuView *menuView = [[MyMenuView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 70)andType:2];
    menuView.delegate = self;
    [self.view addSubview:menuView];
}
-(void)clickHomeHeaderBtnDelegate:(UIButton *)btn
{
    CATransition *anim = [CATransition animation];
    [anim setDuration:0.5];
    [anim setType:@"cube"];
    //etTimingFunction:是动画的种类,和UIView一样,比如匀速动画,快速开始结束等
    [anim setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    [self.navigationController.view.layer addAnimation:anim forKey:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
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
