//
//  UtilTool.h
//  GodAlsoShocked
//
//  Created by 王思源 on 14-9-24.
//  Copyright (c) 2014年 王思源. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UtilTool : NSObject
/**
 * @brief 将字符串转换为NSDate对象
 */
+ (NSDate *) convertNSDateWithString:(NSString *) dateString;
/**
 * @brief 将NSDate对象转换为字符串
 */
+(NSString *) convertNSStringWithDate:(NSDate *) date;
/**
 * @brief 将NSNumber转换为布尔值
 */
+(BOOL) convertBOOLWithNSNumber:(NSNumber *) number;

/**
 *   十六进制color转为UIColor
 */
+(UIColor *) colorWithHexString: (NSString *) stringToConvert alpha:(CGFloat)alpha;

//加载自定义nib文件
+ (id)loadViewOfClass:(Class) clazz;

+ (UIColor *)showAllColorsWithIndex:(NSInteger)index;
@end
