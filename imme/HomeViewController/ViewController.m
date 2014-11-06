//
//  ViewController.m
//  imme
//
//  Created by 王思源 on 14/11/5.
//  Copyright (c) 2014年 immeWithDouBi. All rights reserved.
//

#import "ViewController.h"
#import "HomeTableViewCell.h"
@interface ViewController ()
{
    UINib *nib;
    
    NSInteger colorIndex;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.homeTableView addHeaderWithTarget:self action:@selector(addTableHeader)];
    [self.homeTableView addFooterWithTarget:self action:@selector(addTableFooter)];
    
    MyMenuView *menuView = [[MyMenuView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 70)];
    [self.view addSubview:menuView];
    
    _testArrData = [NSArray arrayWithObjects:@"撒发生的发生法哈德多久啊回复的发生的",@"撒发生的发生法哈德多久啊回复的发生的撒发生的发生法哈德多久啊回复的发生的发生的发生法哈德多久啊回复的发生的撒发生的发生",@"的萨芬的奋斗",@"ddfsdfasdfasdfasd",@"俺的沙发的沙发的所得税",@"俺发大水发dfdf税",@"二二恶我完全而", nil];
    
    //接收通知，改变MyMenuView的高度
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeMenuViewHeight) name:@"showMenuUprightBtn" object:nil];
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
    return 200;
}
-(void)changeMenuViewHeight
{
    NSLog(@"dfasdfasdfasas");
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
