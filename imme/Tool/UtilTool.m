//
//  UtilTool.m
//  GodAlsoShocked
//
//  Created by 王思源 on 14-9-24.
//  Copyright (c) 2014年 王思源. All rights reserved.
//

#import "UtilTool.h"

@implementation UtilTool
+ (NSDate *) convertNSDateWithString:(NSString *) dateString{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [df setDateFormat:@"EEE MMM d HH:mm:ss zzzz yyyy"];
    NSDate * date = [df dateFromString: dateString];
    return date;
}

+(NSString *) convertNSStringWithDate:(NSDate *) date{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    //Mon Oct 31 14:55:31 +0800 2011
    //Wed Nov 2 15:40:17 +0800 2011
    [df setDateFormat:@"yyyy-MM-dd"];
    NSString * dateString = [df stringFromDate:date];
    return dateString;
    
}

+ (BOOL) convertBOOLWithNSNumber:(NSNumber *) number {
    NSInteger value = [number integerValue];
    return (value == 0)?NO:YES;
}

+ (UIColor *) colorWithHexString: (NSString *) stringToConvert alpha:(CGFloat)alpha
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor blackColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}
+ (id)loadViewOfClass:(Class) clazz
{
    @try
    {
        NSArray * nibs = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(clazz) owner:nil options:nil];
        for (id obj in nibs)
        {
            if([obj isKindOfClass:clazz])
            {
                return obj;
            }
        }
        return nil;
    }
    @catch (NSException *exception)
    {
        return nil;
    }
}
+ (UIColor *)showAllColorsWithIndex:(NSInteger)index
{
    UIColor *color1 = [self colorWithHexString:@"#99ff99" alpha:1];
    UIColor *color2 = [self colorWithHexString:@"#FF6600" alpha:1];
    UIColor *color3 = [self colorWithHexString:@"#33CCFF" alpha:1];
    UIColor *color4 = [self colorWithHexString:@"#00CCCC" alpha:1];
    UIColor *color5 = [self colorWithHexString:@"#FF00FF" alpha:1];
    UIColor *color6 = [self colorWithHexString:@"#CCCCCC" alpha:1];
    UIColor *color7 = [self colorWithHexString:@"#FF66FF" alpha:1];
    UIColor *color8 = [self colorWithHexString:@"#0033FF" alpha:1];
    UIColor *color9 = [self colorWithHexString:@"#FFFF99" alpha:1];
    UIColor *color10 = [self colorWithHexString:@"#009933" alpha:1];

    NSArray *colorArr = @[color1,color2,color3,color4,color5,color6,color7,color8,color9,color10];
    if (0 <= index <= 10)
    {
        return [colorArr objectAtIndex:index];
    }
    else
    {
        return [self colorWithHexString:@"#99ff99" alpha:1];
    }
}
@end
