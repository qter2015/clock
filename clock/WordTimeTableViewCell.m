//
//  WordTimeTableViewCell.m
//  clock
//
//  Created by Mac on 16/1/19.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "WordTimeTableViewCell.h"
#import "WordZoneModel.h"
#import "ClockCustom.h"

static NSString *GLOBAL_TIMEFORMAT = @"YYYY-MM-dd HH:mm:ss";
static NSString *GLOBAL_TIMEBASE = @"2012-01-01 00:00:00";

@interface WordTimeTableViewCell(){
    Boolean isShowDigitalClock;
}
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceTimeLabel;
@property (weak, nonatomic) IBOutlet ClockCustom *analogClock;
@property (weak, nonatomic) IBOutlet UILabel *digitalClock;

@end

@implementation WordTimeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //初始化
    isShowDigitalClock = YES;
    [self showClockWithIsShowDigitalClock: isShowDigitalClock];
    
    //设置表盘背景为透明背景
    [_analogClock setBackgroundColor:[UIColor clearColor]];
}

- (void) showUIWithModel: (City *)city
{
    self.cityLabel.text = city.cityName;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:city.zoneString]];
    NSString *timeStr = [formatter stringFromDate:[NSDate date]];
    self.digitalClock.text = timeStr;
    
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:city.zoneString]];
    NSDate *bdate = [formatter dateFromString:timeStr];
    NSString *distanceStr = [self getDistanceToNowForOtherDate: bdate];
    self.distanceTimeLabel.text = distanceStr;
}

//
- (void) showClockWithIsShowDigitalClock: (Boolean)isShow{
    if (isShow) {
        _digitalClock.hidden = YES;
        _analogClock.hidden = NO;
    }
    else{
        _digitalClock.hidden = NO;
        _analogClock.hidden = YES;
    }
}

//cell click
- (void) cellClick{
    //初始化
    isShowDigitalClock = !isShowDigitalClock;
    [self showClockWithIsShowDigitalClock: isShowDigitalClock];
}

//获取两个时间相差多少
- (NSString *) getDistanceToNowForOtherDate: (NSDate *) aDate{
    //获取当前时间
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    
    NSMutableString * str = [[NSMutableString alloc] initWithFormat:@"今天"];
    //获取时间差
    NSTimeInterval distance = [aDate timeIntervalSinceReferenceDate] - [localeDate timeIntervalSinceReferenceDate];
    long lTime = (long)distance;

    if (lTime > 0) {
        [str appendFormat:@"，早"];
        NSInteger iHours = (lTime / 3600);
        [str appendFormat:@"%ld小时", iHours];
    }
    else if (lTime < 0){
        lTime = 0 - lTime;
        [str appendFormat:@"，晚"];
        NSInteger iHours = (lTime / 3600);
        [str appendFormat:@"%ld小时", iHours];
    }
    
    return str;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
