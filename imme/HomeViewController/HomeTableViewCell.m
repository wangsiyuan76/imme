//
//  HomeTableViewCell.m
//  imme
//
//  Created by 王思源 on 14/11/5.
//  Copyright (c) 2014年 immeWithDouBi. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (void)awakeFromNib
{
    _headImage.layer.masksToBounds = YES;
    _headImage.layer.cornerRadius = 20;
    [_headImage setImage:[UIImage imageNamed:@"LLShareLaiwang"]];
    
    _contentLab.lineBreakMode = NSLineBreakByCharWrapping;
    _contentLab.numberOfLines = 0;
    
}
-(void)setContentWithStr:(NSString *)str
{
    _contentLab.text = str;
    CGRect contentFrame = _contentLab.frame;
//    CGSize contentSize = [_contentLab.text sizeWithFont:_contentLab.font constrainedToSize:CGSizeMake(_contentLab.frame.size.width, 2000) lineBreakMode:NSLineBreakByCharWrapping];
    NSDictionary *attribute = [NSDictionary dictionaryWithObjectsAndKeys:_contentLab.font,NSFontAttributeName, nil];
    CGSize contentSize = [_contentLab.text boundingRectWithSize:CGSizeMake(_contentLab.frame.size.width - 100, 2000) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine attributes:attribute context:nil].size;
    contentFrame.size.height = contentSize.height;
   _contentLab.frame = contentFrame;
    DLog(@"--------%lf",_contentLab.frame.size.height);

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
