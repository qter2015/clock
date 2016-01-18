//
//  WordTimeTableViewController.m
//  clock
//
//  Created by Mac on 16/1/18.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "WordTimeTableViewController.h"

@interface WordTimeTableViewController ()

@end

@implementation WordTimeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建导航栏
    [self createNavBar];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//初始化导航栏
- (void) createNavBar{
    //颜色定义
    UIColor *redColor = [UIColor colorWithRed:0.992 green:0.004 blue:0.004 alpha:1.00];
    UIColor *blackColor = [UIColor colorWithRed:0.078 green:0.078 blue:0.078 alpha:1.00];
    
    //左按钮
    UIBarButtonItem *editButtonItem = [[UIBarButtonItem alloc]init];
    [editButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:redColor, NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    editButtonItem.title = @"编辑";
    [editButtonItem setStyle:UIBarButtonItemStylePlain];
    self.navigationItem.leftBarButtonItem = editButtonItem;
    //右按钮
    UIBarButtonItem *addButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addWordTimeClick)];
    [addButtonItem setTintColor:redColor];
    self.navigationItem.rightBarButtonItems = @[addButtonItem];
    
    self.title = @"世界时间";
}

- (void) addWordTimeClick{
    NSLog(@"addWordTime click");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
