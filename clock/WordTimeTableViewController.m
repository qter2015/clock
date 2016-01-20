//
//  WordTimeTableViewController.m
//  clock
//
//  Created by Mac on 16/1/18.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "WordTimeTableViewController.h"
#import "WordTimeTableViewCell.h"
#import "CitySelectViewController.h"

@interface WordTimeTableViewController (){
    NSMutableArray *wordTimeArray;
    
    UIBarButtonItem *editButtonItem;
    UIBarButtonItem *addButtonItem;
}

@end

@implementation WordTimeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建导航栏
    [self createNavBar];
    
    wordTimeArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < 4; i++) {
        [wordTimeArray addObject:[NSString stringWithFormat:@"MyCellDemon%i",i]];
    }
    
    //定义表格的行高
    self.tableView.rowHeight = 90.f;
    [self.tableView registerNib:[UINib nibWithNibName:@"WordTimeTableViewCell" bundle:nil] forCellReuseIdentifier:@"WordTimeTableViewCell"];
    
    //tableview 背景色
    [self.tableView setBackgroundColor:[UIColor colorWithRed:0.937 green:0.937 blue:0.957 alpha:1.00]];
    
    //没内容不显示cell
    self.tableView.tableFooterView = [[UIView alloc] init];
}

//初始化导航栏
- (void) createNavBar{
    //颜色定义
    UIColor *redColor = [UIColor colorWithRed:0.992 green:0.004 blue:0.004 alpha:1.00];
    UIColor *blackColor = [UIColor colorWithRed:0.078 green:0.078 blue:0.078 alpha:1.00];
    
    //左编辑按钮
    editButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editButtonItemClick)];
    [editButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:redColor, NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = editButtonItem;
    //右增加按钮
    addButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonItemClick)];
    [addButtonItem setTintColor:redColor];
    self.navigationItem.rightBarButtonItems = @[addButtonItem];
    
    //标题
    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 20)];
    [titleView setText:@"世界时间"];
    [titleView setTextColor:blackColor];
    [self.navigationItem setTitleView:titleView];
    
    //设置高度
    CGRect navigationBarFrameOld = self.navigationController.navigationBar.frame;
    NSLog(@"%f", navigationBarFrameOld.size.height);
    navigationBarFrameOld.size.height = 100;
    self.navigationController.navigationBar.frame = navigationBarFrameOld;
    navigationBarFrameOld = self.navigationController.navigationBar.frame;
    NSLog(@"%f", navigationBarFrameOld.size.height);
}

- (void) editButtonItemClick{
    if (self.tableView.editing) {
        [editButtonItem setTitle:@"编辑"];
        //设置编辑状态
        [self.tableView setEditing:NO animated:YES];
    }
    else{
        [editButtonItem setTitle:@"完成"];
        //设置编辑状态
        [self.tableView setEditing:YES animated:YES];
        
        //隐藏label
        /*
        NSUInteger rowCount = wordTimeArray.count;
        for (NSUInteger i = 1; i <= rowCount; i++) {
            WordTimeTableViewCell* cell=[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathWithIndex:i]];
            
            [cell.timeLabel setHidden:TRUE];
        }
        */
    }
    
}

- (void) addButtonItemClick{
    //从下而上弹出模态页面
    CitySelectViewController *citySelectVC = [[CitySelectViewController alloc]initWithNibName:@"CitySelectViewController" bundle:nil];
    
    [self presentViewController:citySelectVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [wordTimeArray count];
}


//自定义cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WordTimeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"WordTimeTableViewCell"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

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


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}


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
