//
//  WordTimeTableViewCell.h
//  clock
//
//  Created by Mac on 16/1/19.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WordTimeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *clockImg;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
