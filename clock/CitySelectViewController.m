//
//  CitySelectViewController.m
//  clock
//
//  Created by Mac on 16/1/20.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "CitySelectViewController.h"

@interface CitySelectViewController ()

@end

@implementation CitySelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
