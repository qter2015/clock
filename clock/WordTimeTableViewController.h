//
//  WordTimeTableViewController.h
//  clock
//
//  Created by Mac on 16/1/18.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WordZoneModel.h"

@interface WordTimeTableViewController : UITableViewController

- (void) addCity: (City *)city;
- (void) removeCity: (City *)city;
@end
