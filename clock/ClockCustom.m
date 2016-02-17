//
//  ClockCustom.m
//  clock
//
//  Created by Mac on 16/2/5.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "ClockCustom.h"

#define PI 3.1415926535

#define NihtTimeStart 18    //晚上时间从18点开始 6点结束
#define NightTimeEnd 6

#define DayBackgroundColoc ([UIColor colorWithRed:220.0f/255 green:220.0f/255 blue:220.0f/255 alpha:1])   //白天表盘的颜色
#define DayTextColoc ([UIColor blackColor])   //白天钟表文字颜色
#define NightBackgroundColoc ([UIColor colorWithRed:220.0f/255 green:220.0f/255 blue:220.0f/255 alpha:1])     //夜晚时间表盘颜色
#define NightTextColoc ([UIColor whiteColor])     //夜晚时间表盘颜色

@interface ClockCustom ()

@property (strong, nonatomic) UIColor *clockBackgroundColor;
@property (strong, nonatomic) UIColor *clockTextColor;

@end

@implementation ClockCustom

@synthesize clockBackgroundColor;
@synthesize clockTextColor;
@synthesize currentTime;

//根据时间设置表盘颜色
- (UIColor *) clockBackgroundColor{
    time_t result = (int)time(NULL);
    struct tm *curmon_timeinfo = localtime(&result);
    int hour = curmon_timeinfo->tm_hour;
    if (hour > NihtTimeStart || hour < NightTimeEnd) {
        return NightBackgroundColoc;
    }
    else{
        return DayBackgroundColoc;
    }
}

//根据时间设置表盘颜色
- (UIColor *) clockTextColor{
    time_t result = (int)time(NULL);
    struct tm *curmon_timeinfo = localtime(&result);
    int hour = curmon_timeinfo->tm_hour;
    if (hour > NihtTimeStart || hour < NightTimeEnd) {
        return NightTextColoc;
    }
    else{
        return DayTextColoc;
    }
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef con = UIGraphicsGetCurrentContext();
    
    //开启抗锯齿
    CGContextSetAllowsAntialiasing(con, YES);
    
    ;
    
    //画表盘
    CGContextSetFillColorWithColor(con, [self.clockBackgroundColor CGColor]);
    CGContextFillEllipseInRect(con, rect);
    //画刻度
    NSInteger hourCount = 12;   //时钟个数
    CGFloat angle = 360 / 12;
    CGFloat textRadius = rect.size.width / 2 - 7;
    
    NSLog(@"%f", sinf(12 * 30 * PI / 180));
    
    //绘制刻度
    for (NSInteger i = 1; i <= hourCount; i++) {
        CGPoint originPoint = CGPointMake(rect.size.width / 2, rect.size.height / 2);
        CGFloat x = originPoint.x + sinf(angle * i * PI / 180) * textRadius;
        CGFloat y = originPoint.y - cosf(angle * i * PI / 180) * textRadius;
        NSString * text = [NSString stringWithFormat:@"%ld", i];
        
        CGContextSetFillColorWithColor(con, [self.clockTextColor CGColor]);
        CGRect textRect = CGRectMake(x - 6, y - 5, 14, 14);
        
        UIFont *font = [UIFont fontWithName:@"Courier" size:11];
        NSMutableParagraphStyle *fontStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        fontStyle.alignment = NSTextAlignmentCenter;
        
        NSDictionary *textAttributes = @{NSFontAttributeName: font, NSParagraphStyleAttributeName: fontStyle};
        
        [text drawInRect:textRect withAttributes:textAttributes];
    }
    
    CGContextStrokePath(con);
}


@end
