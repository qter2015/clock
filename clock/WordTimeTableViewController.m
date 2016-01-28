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
#import "WordZoneModel.h"

@interface WordTimeTableViewController ()<CitySelectViewDelegate>{
    UIBarButtonItem *editButtonItem;
    UIBarButtonItem *addButtonItem;
}

@property (strong, nonatomic) NSMutableArray *wordZoneArray;

@end

@implementation WordTimeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建导航栏
    [self createNavBar];
    
    _wordZoneArray = [[NSMutableArray alloc]init];
    /*
    for (NSInteger i = 0; i < 4; i++) {
        City *city = [[City alloc] init];
        city.cityName = [[NSString alloc] initWithFormat:@"北京%ld", i];
        city.zoneString = [[NSString alloc] initWithFormat:@"北京时区%ld", i];
        [wordZoneArray addObject:city];
    }
    
    [self saveUserData];
     */
    //取出城市
    [self readUserData];
    //刷新编辑按钮状态
    [self refreshEditButtonStatus];
    
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
}

//刷新编辑按钮状态
- (void) refreshEditButtonStatus{
    if (_wordZoneArray.count == 0) {
        self.navigationItem.leftBarButtonItem = nil;
        //按钮状态
        [editButtonItem setTitle:@"编辑"];
        [self.tableView setEditing:NO animated:YES];
    }
    else {
        self.navigationItem.leftBarButtonItem = editButtonItem;
    }
}

//自定义数组 自定义对象
- (void) saveUserData{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *encodemenulist = [NSKeyedArchiver archivedDataWithRootObject:_wordZoneArray];
    [userDefaults setObject:encodemenulist forKey:@"wordTimeList"];
}

//取出自定义对象数组
- (void) readUserData{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *saveMenulistDaate = [userDefaults objectForKey:@"wordTimeList"];
    if (nil == saveMenulistDaate) {
        NSMutableArray *menulistarry = [[NSMutableArray alloc]init];
        _wordZoneArray = menulistarry;
    }
    else{
        _wordZoneArray = (NSMutableArray *)[NSKeyedUnarchiver unarchiveObjectWithData:saveMenulistDaate];
        
        //批量添加
        NSInteger count = _wordZoneArray.count;
        for (NSInteger row = 0; row < count; row++) {
            [self addCityForRow:row];
        }
    }
}

//选择城市
- (void) selectCity:(City *)city{
    for (City *sourceCity in _wordZoneArray) {
        if([sourceCity.cityName isEqualToString:city.cityName])
            return;
    }
    
    [_wordZoneArray addObject:city];
    
    //增加城市
    [self addCityForRow: (_wordZoneArray.count - 1)];
}

//增加城市
- (void) addCityForRow: (NSInteger)row{
    //刷新编辑按钮状态
    [self refreshEditButtonStatus];
    //添加进
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:row inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
    
    //存入本地文件
    [self saveUserData];
}

//删除城市
- (void) deleteCityForRow: (NSInteger)row{
    [_wordZoneArray removeObjectAtIndex:row];
    //刷新编辑按钮状态
    [self refreshEditButtonStatus];
    
    [self.tableView beginUpdates];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:row inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
    
    //存入本地文件
    [self saveUserData];
}
//移动城市
- (void) moveCityFromRow: (NSInteger)fromRow toRow:(NSInteger)toRow{
    if (fromRow == toRow) {
        return;
    }
    City *fromCity = [_wordZoneArray objectAtIndex:fromRow];
    [_wordZoneArray removeObjectAtIndex:fromRow];
    if (fromRow > toRow) {
        [_wordZoneArray insertObject:fromCity atIndex:toRow];
    }
    else if(fromRow < toRow){
        [_wordZoneArray insertObject:fromCity atIndex:toRow];
    }
    
    //存入本地文件
    [self saveUserData];
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
    citySelectVC.delegate = self;
    
    [self presentViewController:citySelectVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_wordZoneArray count];
}


//自定义cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WordTimeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"WordTimeTableViewCell" forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    City *city = [_wordZoneArray objectAtIndex:indexPath.row];
    [cell showUIWithModel:city];
    
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
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 1)
    {
        return UITableViewCellEditingStyleInsert;
    }
    else{
        return UITableViewCellEditingStyleDelete;
    }
}
*/

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

    if (editingStyle == UITableViewCellEditingStyleDelete){
        [self deleteCityForRow:indexPath.row];
    }
}


//移动
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    [self moveCityFromRow:fromIndexPath.row toRow:toIndexPath.row];
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
