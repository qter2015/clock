//
//  CitySelectViewController.h
//  clock
//
//  Created by Mac on 16/1/23.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WordZoneModel.h"

@protocol CitySelectViewDelegate <NSObject>

- (void) selectCity: (City *)city;

@end

@interface CitySelectViewController : UIViewController

@property (weak, nonatomic) id<CitySelectViewDelegate> delegate;

@end
