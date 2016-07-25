//
//  YXModelFrame.m
//  Demo
//
//  Created by 白宇翔 on 16/7/22.
//  Copyright © 2016年 白宇翔. All rights reserved.
//

// title Font
#define TitleFont [UIFont systemFontOfSize:16]
//Descrit Font
#define DescritFont [UIFont systemFontOfSize:15]

#import "YXModelFrame.h"
#import "YXModel.h"
@implementation YXModelFrame

-(void)setModel:(YXModel *)model {
    
    _model = model;
    
    //Spacing of child controls
    CGFloat padding = 10;
    
    //title
    CGFloat titleX = padding;
    CGFloat titleY = padding;
    CGSize titleSize = [self sizeWithText:self.model.title font:TitleFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    _titleF = CGRectMake(titleX, titleY, titleSize.width, titleSize.height);
    //descrit
    CGFloat descritX = padding;
    CGFloat descritY = CGRectGetMaxY(_titleF) + padding;
    CGSize descritSize = [self sizeWithText:self.model.descriPtion font:DescritFont maxSize:CGSizeMake(200, MAXFLOAT)];
    _descritF = CGRectMake(descritX, descritY, descritSize.width, descritSize.height);
    //picture
    CGFloat pictureX =descritSize.width + descritX;
    CGFloat pictureY = CGRectGetMaxY(_titleF) + padding;
    CGFloat pictureW = 375-padding * 4 - descritSize.width;
    CGFloat pictureH = 0;
    if (descritSize.height > 100) {
        pictureH = descritSize.height;
    }else{
        pictureH = 80;
    }
    _pictureF= CGRectMake(pictureX, pictureY, pictureW, pictureH);

    if (self.model.title && self.model.descriPtion && self.model.imageHref == nil) {
        CGSize descritSize = [self sizeWithText:self.model.descriPtion font:DescritFont maxSize:CGSizeMake(340, MAXFLOAT)];
        _descritF = CGRectMake(descritX, descritY, descritSize.width, descritSize.height);
        _cellHeight = CGRectGetMaxY(_titleF) + CGRectGetMaxY(_descritF) - padding;
    }
    if (self.model.title && self.model.imageHref) {

    _cellHeight = CGRectGetMaxY(_titleF) + CGRectGetMaxY(_pictureF) - padding;

    }

    if (self.model.title && self.model.imageHref && self.model.descriPtion) {
      _cellHeight = CGRectGetMaxY(_titleF) +CGRectGetMaxY(_pictureF) - padding;
        
    }

}
#pragma mark -- Calculate the height of the string

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}


@end
