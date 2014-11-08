//
//  HomeViewController.h
//  imme
//
//  Created by 王思源 on 14/11/8.
//  Copyright (c) 2014年 immeWithDouBi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyMenuView.h"

@interface HomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,MenuViewDelegate>
@property (strong, nonatomic) NSArray *testArrData;

@property (weak, nonatomic) IBOutlet UITableView *homeTableView;
@end
