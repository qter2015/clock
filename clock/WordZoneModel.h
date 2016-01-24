//
//  WordZoneModel.h
//  clock
//
//  Created by Mac on 16/1/23.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject
@property (copy, nonatomic) NSString *cityName;
@property (copy, nonatomic) NSString *zoneString;

- (NSArray *) getCityArray;

@end

@interface WordZoneModel : NSObject


@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) NSMutableArray *cityArray;

- (NSArray *) getCityArrayOfSection;

@end
