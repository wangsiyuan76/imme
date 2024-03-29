//
//  HomeViewController.m
//  imme
//
//  Created by 王思源 on 14/11/8.
//  Copyright (c) 2014年 immeWithDouBi. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "PublishViewController.h"
#import "FXBlurView.h"
@interface HomeViewController ()
{
    UINib *nib;
    
    NSInteger colorIndex;
    FXBlurView *fxb;//模糊地背景视图
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.homeTableView addHeaderWithTarget:self action:@selector(addTableHeader)];
    [self.homeTableView addFooterWithTarget:self action:@selector(addTableFooter)];
    
    MyMenuView *menuView = [[MyMenuView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 70)andType:0];
    menuView.delegate = self;
    [self.view addSubview:menuView];
    
    _testArrData = [NSArray arrayWithObjects:@"撒发生的发生法哈德多久啊回复的发生的",@"撒发生的发生法哈德多久啊回复的发生的撒发生的发生法哈德多久啊回复的发生的发生的发生法哈德多久啊回复的发生的撒发生的发生",@"的萨芬的奋斗",@"ddfsdfasdfasdfasd",@"俺的沙发的沙发的所得税",@"俺发大水发dfdf税",@"二二恶我完全而", nil];
    
    //接收通知，改变MyMenuView的高度
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeMenuViewHeight:) name:@"showMenuUprightBtn" object:nil];
}
-(void)changeMenuViewHeight:(NSNotification *)obj
{
    NSNumber *num = obj.object;
    NSInteger select = [num integerValue];
    if (select%2 != 0)//是否显示模糊背景
    {
        if (!fxb)
        {
            fxb = [[FXBlurView alloc]initWithFrame:self.view.frame];
            fxb.blurRadius = 1;
            [self.homeTableView addSubview:fxb];
            self.homeTableView.userInteractionEnabled = NO;
        }
    }
    else
    {
        [fxb removeFromSuperview];
        fxb = nil;
        self.homeTableView.userInteractionEnabled = YES;
    }
    DLog(@"dddd");
   }
#pragma mark MenuViewDelegate
-(void)clickHomeHeaderBtnDelegate:(UIButton *)btn
{
    //自定义PUSH动画
    CATransition *anim = [CATransition animation];
    [anim setDuration:0.5];
    [anim setType:@"cube"];
    //etTimingFunction:是动画的种类,和UIView一样,比如匀速动画,快速开始结束等
    [anim setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    [self.navigationController.view.layer addAnimation:anim forKey:nil];
    [self.navigationController pushViewController:[[PublishViewController alloc]init] animated:YES];
}
#pragma mark 上下拉刷新
-(void)addTableHeader
{
    DLog(@"上拉刷新开始");
    // 2.2秒后结束刷新
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.homeTableView reloadData];
        DLog(@"上拉刷新结束")
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.homeTableView headerEndRefreshing];
    });
}
-(void)addTableFooter
{
    DLog(@"下拉刷新开始");
    // 2.2秒后结束刷新
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.homeTableView reloadData];
        DLog(@"下拉刷新结束")
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.homeTableView footerEndRefreshing];
    });
    
}
#pragma mark UITableViewDatagate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _testArrData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*cellStr = @"HomeTableViewCell";
    if (!nib)
    {
        nib = [UINib nibWithNibName:@"HomeTableViewCell" bundle:[NSBundle mainBundle]];
        [tableView registerNib:nib forCellReuseIdentifier:cellStr];
    }
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (!cell)
    {
        [tableView registerNib:nib forCellReuseIdentifier:cellStr];
        cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    }
    
    //获取一个1-10之间的随机数，并且不能重复
    NSInteger i= colorIndex;
    do {
        colorIndex = rand()%10;
    } while (colorIndex == i);
    
    UIColor *color = [UtilTool showAllColorsWithIndex:colorIndex];
    [cell.contentView setBackgroundColor:color];
    [cell setContentWithStr:[_testArrData objectAtIndex:indexPath.row]];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//        HomeTableViewCell *cell = (HomeTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
//       CGSize cellSize = [cell showCellHeightWithTitle:[_testArrData objectAtIndex:indexPath.row]];
//        DLog(@"-------cell.cellHeight==%f",cell.cellHeight);
//    return  cell.cellHeight + 30;
    return 130;
}


-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
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
