//
//  SearchCityResultViewController.h
//  clock
//
//  Created by Mac on 16/1/24.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class City;

@protocol SearchCityResultDelegate <NSObject>

- (void) selectCity: (City *)city;

@end

@interface SearchCityResultViewController : UITableViewController

@property (copy, nonatomic) NSString *searchCityString;
@property (weak, nonatomic) id<SearchCityResultDelegate> delegate;

@end
