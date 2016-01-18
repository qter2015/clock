//
//  WordTimeViewController.m
//  clock
//
//  Created by Mac on 16/1/18.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "WordTimeViewController.h"
#import "WordTimeTableViewController.h"

@interface WordTimeViewController ()

@end

@implementation WordTimeViewController

@synthesize wordTimeTVC;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //设置背景色
    [self.view setBackgroundColor:[UIColor colorWithRed:0.937 green:0.937 blue:0.957 alpha:1.00]];
    
    //设置tabbar
    self.tabBarItem = [[UITabBarItem alloc]init];
    self.tabBarItem.title = @"世界时间";
    [self.toolbar setTintColor:[UIColor redColor]];
    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0.584 green:0.584 blue:0.584 alpha:1.00], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0.988 green:0.012 blue:0.000 alpha:1.00], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    //插入子vc
    wordTimeTVC = [[WordTimeTableViewController alloc] init];
    [self pushViewController:wordTimeTVC animated:YES];
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
