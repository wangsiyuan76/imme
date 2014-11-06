//
//  ConstantsDefine.h
//  GodAlsoShocked
//
//  Created by 王思源 on 14-9-9.
//  Copyright (c) 2014年 王思源. All rights reserved.
//

#define MOBILE @"mobile"

#define DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}

/**
 *  正式或测试 API地址在此开关，注释此行表示正式环境
 */
#define TEST

/**
 *  正式地址
 */
#define RELEASE_XIAOYU_API_URL     @"api.xiaoyu.com"
#define RELEASE_XMFISH_BBSAPI_URL  @"bbs.xmfish.com"
/**
 *  测试地址
 */
#define TEST_XIAOYU_API_URL     @"api.dev.xiaoyu.com"
#define TEST_XMFISH_BBSAPI_URL  @"bbs.dev.xmfish.com"
/**
 *  标记是否切换测试环境
 */
#define kSetTestOrNo @"kSetTestOrNo"


#pragma mark 设置用户的一些属性
/**
 *  城市ID
 */
#define CURRENT_CITY_ID [[NSUserDefaults standardUserDefaults] integerForKey:@"current_citySelected"]
/**
 *  通行证UID
 */
#define CURRENT_PASSPORT_UID [[NSUserDefaults standardUserDefaults] integerForKey: @"Current_Passport_UID"]
#define SET_CURRENT_PASSPORT_UID(intValue)[[NSUserDefaults standardUserDefaults] setInteger:intValue forKey:@"Current_Passport_UID"]

/**
 *  论坛账号Token
 */
#define CURRENT_TOKEN [[NSUserDefaults standardUserDefaults] objectForKey:@"Current_Token"]
#define SET_CURRENT_TOKEN(str) [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"Current_Token"]

/**
 *  论坛账号UID
 */
#define CURRENT_BBS_UID [[NSUserDefaults standardUserDefaults] integerForKey: @"Current_BBS_UID"]
#define SET_CURRENT_BBS_UID(intValue) [[NSUserDefaults standardUserDefaults] setInteger:intValue forKey:@"Current_BBS_UID"]


#pragma mark 获取系统上的一些属性
/**
 *  获取当前屏幕的宽高
 */
#define AppFrameWidth  [[UIScreen mainScreen] applicationFrame].size.width
#define AppFrameHeigh  [[UIScreen mainScreen]applicationFrame].size.height
/**
 *  获取当前window宽高
 */
#define ScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height

/**
 *  NavigationBar高度和StatusBar高度
 */
#define KNavigationBarHeight CGRectGetHeight(self.navigationController.navigationBar.frame)
#define KStatusBarHeight CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)

/**
 *  NavigationBar高度 + StatusBar高度
 */
#define KNavHeightPlusKStatusHeight (CGRectGetHeight(self.navigationController.navigationBar.frame) + CGRectGetHeight([UIApplication sharedApplication].statusBarFrame))

//当前版本
#define IOS_VERSION     ( [[UIDevice currentDevice].systemVersion floatValue] )