//
//  WordTimeTableViewCell.h
//  clock
//
//  Created by Mac on 16/1/19.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class City;

@interface WordTimeTableViewCell : UITableViewCell

- (void) showUIWithModel: (City *)city;

- (void) cellClick;

@end
