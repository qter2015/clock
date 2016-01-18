//
//  MainViewController.m
//  clock
//
//  Created by Mac on 16/1/18.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "MainViewController.h"
#import "WordTimeViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建tab
    [self createMainChildController];
}

//创建tab
- (void) createMainChildController{
    //加入tabcontroller
    WordTimeViewController *wordTimeVC = [[WordTimeViewController alloc]init];
    [self addChildViewController:wordTimeVC];
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
