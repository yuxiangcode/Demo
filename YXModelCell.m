//
//  modelCell.m
//  
//
//  Created by 白宇翔 on 16/7/22.
//
//


// title Font
#define TitleFont [UIFont systemFontOfSize:16]
//Descrit Font
#define DescritFont [UIFont systemFontOfSize:15]

#import "YXModelCell.h"
#import "YXModel.h"
#import "UIImageView+WebCache.h"
#import "YXModelFrame.h"

@interface YXModelCell()
/**
 * title
 */
@property (nonatomic, weak)UILabel *titleView;
/**
 * descrit
 */
@property (nonatomic, weak)UILabel *descritView;
/**
 * picture
 */
@property (nonatomic, weak)UIImageView *pictureView;

@end

@implementation YXModelCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //title
        UILabel *titleView = [[UILabel alloc] init];
        titleView.font = TitleFont;
        [self.contentView addSubview:titleView];
        titleView.textColor = [UIColor colorWithRed:0 green:61/255.0 blue:125/255.0 alpha:1.0];
        self.titleView = titleView;
        //descrit
        UILabel *descritView = [[UILabel alloc] init];
        [self.contentView addSubview:descritView];
        descritView.font = DescritFont;
        descritView.numberOfLines = 0;
        self.descritView = descritView;
        //picture
        UIImageView *pictureView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureView];
        self.pictureView = pictureView;
  
    }
    return self;
}
#pragma mark --  Setting frame and display data

-(void)setModelFrame:(YXModelFrame *)modelFrame {
    _modelFrame = modelFrame;
   
    [self settingData];
    
    [self settingFrame];
}
/**
 * setting data
 */
- (void)settingData {

    if (self.modelFrame.model.title) {
        self.titleView.hidden = NO;
        self.titleView.text = self.modelFrame.model.title;
    } else {
        self.titleView.hidden = YES;
    }
    if (self.modelFrame.model.descriPtion) {
        self.descritView.hidden = NO;
        self.descritView.text = self.modelFrame.model.descriPtion;
    } else {
        self.descritView.hidden = YES;
    }
    if (self.modelFrame.model.imageHref) {
        self.pictureView.hidden = NO;
        [self.pictureView sd_setImageWithURL:[NSURL URLWithString:self.modelFrame.model.imageHref] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    } else {
        self.pictureView.hidden = YES;
    }
}


/**
 * setting frame
 **/
- (void)settingFrame {
    //title
    if (self.modelFrame.model.title) {
      
        self.titleView.frame = self.modelFrame.titleF;
    }
    //descrit
    if (self.modelFrame.model.descriPtion) {
        self.descritView.frame = self.modelFrame.descritF;
    }
    //picture
    if (self.modelFrame.model.imageHref) {
        self.pictureView.frame =  self.modelFrame.pictureF;
    }
}
#pragma mark -- Calculate the height of the string
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

#pragma mark -- create Cell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"ID";
    YXModelCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[YXModelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

@end
