//
//  WordTimeModel.h
//  clock
//
//  Created by Mac on 16/1/21.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordTimeModel : NSObject

@property (weak, nonatomic) NSString *city;                 //城市
@property (assign, nonatomic) double distanceCurrentTime;   //距离当前城市时间
@property (assign, nonatomic) double currentTime;           //当前时间

@end
