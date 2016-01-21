//
//  CitySelectViewController.m
//  clock
//
//  Created by Mac on 16/1/20.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "CitySelectViewController.h"

@interface CitySelectViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UITableView *cityTableView;
@end

@implementation CitySelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //设置外观
    //设置searchbar颜色
    [self.searchBar setBarTintColor:[UIColor colorWithRed:0.949 green:0.949 blue:0.957 alpha:1.00]];
    //去除search上下边框
    [[[[self.searchBar . subviews objectAtIndex : 0 ] subviews ] objectAtIndex : 0 ] removeFromSuperview ];
    [self.searchBar setBackgroundColor :[ UIColor clearColor ]];
    //设置按钮颜色
    [self.cancelButton setTitleColor:[UIColor colorWithRed:0.988 green:0.012 blue:0.000 alpha:1.00] forState:UIControlStateNormal];
    
}

- (IBAction)cancelClick:(id)sender {
    //模态返回
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
