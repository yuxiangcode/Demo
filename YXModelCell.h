//
//  modelCell.h
//  
//
//  Created by 白宇翔 on 16/7/22.
//
//

#import <UIKit/UIKit.h>
@class YXModelFrame;

@interface YXModelCell : UITableViewCell

@property (nonatomic, strong)YXModelFrame *modelFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
