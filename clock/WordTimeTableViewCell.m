//
//  WordTimeTableViewCell.m
//  clock
//
//  Created by Mac on 16/1/19.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "WordTimeTableViewCell.h"
#import "WordZoneModel.h"

@interface WordTimeTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceTimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *clockImage;

@end

@implementation WordTimeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setBackgroundColor:[UIColor blackColor]];
    [self.cityLabel setTintColor:[UIColor whiteColor]];
}

- (void) showUIWithModel: (City *)city
{
    NSLog(@"%@", city.cityName);
    self.cityLabel.text = city.cityName;
    NSLog(@"%@", self.cityLabel);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
