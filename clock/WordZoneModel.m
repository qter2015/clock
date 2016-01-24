//
//  WordZoneModel.m
//  clock
//
//  Created by Mac on 16/1/23.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "WordZoneModel.h"

@interface City()<NSCoding>

@end

@implementation City

- (City *) init{
    self = [super init];
    if (self) {
        self.cityName = [[NSString alloc] init];
        self.zoneString = [[NSString alloc] init];
    }
    
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init])
    {
        self.cityName = [aDecoder decodeObjectForKey:@"cityName"];
        self.zoneString = [aDecoder decodeObjectForKey:@"zoneString"];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.cityName forKey:@"cityName"];
    [aCoder encodeObject:self.zoneString forKey:@"zoneString"];
}

- (NSArray *) getCityArray{
    NSMutableArray *cities = [[NSMutableArray alloc] init];
    
    NSArray *zoneArray = [NSTimeZone knownTimeZoneNames];
    NSInteger count = zoneArray.count;
    //抽出分组
    count = zoneArray.count;
    for (NSInteger i = 0; i < count; i++) {
        
        NSString *zoneTimeSourceStr = [zoneArray objectAtIndex:i];
        //处理字符串，将字符串分割，取出城市字符串，保留分区字符串
        NSString *zoneTimeStr = [[NSString alloc] init];
        NSArray *strArray = [zoneTimeSourceStr componentsSeparatedByString:@"/"];
        if (strArray.count == 2) {
            zoneTimeStr = [strArray objectAtIndex:1];        }
        else{
            continue;
        }
        
        City* city = [[City alloc]init];
        city.cityName = zoneTimeStr;
        city.zoneString = zoneTimeSourceStr;

        [cities addObject:city];
    }

    return cities;
}

@end

@implementation WordZoneModel

@synthesize title;
@synthesize cityArray;

- (WordZoneModel *) init{
    self = [super init];
    if(self){
        self.title = [[NSString alloc] init];
        self.cityArray  = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *) getCityArrayOfSection{
    NSArray *zoneArray = [NSTimeZone knownTimeZoneNames];
    NSInteger count = zoneArray.count;
    //抽出分组
    count = zoneArray.count;
    NSMutableDictionary *wordZoneDictionary = [[NSMutableDictionary alloc]init];
    for (NSInteger i = 0; i < count; i++) {
        
        NSString *zoneTimeSourceStr = [zoneArray objectAtIndex:i];
        //处理字符串，将字符串分割，取出城市字符串，保留分区字符串
        NSString *zoneTimeStr = [[NSString alloc] init];
        NSArray *strArray = [zoneTimeSourceStr componentsSeparatedByString:@"/"];
        if (strArray.count == 2) {
            zoneTimeStr = [strArray objectAtIndex:1];
        }
        else{
            continue;
        }
        
        [zoneTimeStr stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        NSString *firstWord = [zoneTimeStr substringToIndex: 1];
        
        WordZoneModel *model = [wordZoneDictionary objectForKey:firstWord];
        if (model != nil) {
            City* city = [[City alloc]init];
            city.cityName = zoneTimeStr;
            city.zoneString = zoneTimeSourceStr;
            [model.cityArray addObject:city];
        }
        else{
            WordZoneModel *model = [[WordZoneModel alloc] init];
            model.title = firstWord;
            City* city = [[City alloc]init];
            city.cityName = zoneTimeStr;
            city.zoneString = zoneTimeSourceStr;
            [model.cityArray addObject:city];
            [wordZoneDictionary setObject:model forKey:firstWord];
        }
    }
    
    //排序数组
    NSMutableArray *modelArray = [[NSMutableArray alloc] init];
    for (NSString *key in wordZoneDictionary)
    {
        [self insertArraySortInArray:modelArray withDestObject:[wordZoneDictionary objectForKey:key] andKey:key];
    }
    return modelArray;
}

//根据排序插入
- (void)insertArraySortInArray: (NSMutableArray *)sourceArray withDestObject: (WordZoneModel *)destObject andKey: (NSString *)key {
    NSInteger count = sourceArray.count;
    NSInteger index = 0;
    for (NSInteger i = 0; i < count; i++) {
        WordZoneModel *model = [sourceArray objectAtIndex:i];
        if ([model.title compare:key] == NSOrderedDescending) {
            index = i;
            break;
        }
    }
    [sourceArray insertObject:destObject atIndex:index];
}
@end
