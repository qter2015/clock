//
//  CitySelectViewController.m
//  clock
//
//  Created by Mac on 16/1/23.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "CitySelectViewController.h"
#import "WordZoneModel.h"
#import "SearchCityResultViewController.h"
#import "UIView+AutoLayout.h"
#import "WordTimeTableViewController.h"

@interface CitySelectViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UIView *navigationBar;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) NSArray *wordZoneArray;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UITableView *cityTableView;
@property (weak, nonatomic) IBOutlet UIView *coverView;
@property (strong, nonatomic) SearchCityResultViewController *searchCityResultVC;

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
    
    //绑定点击事件
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(coverViewClick)];
    [self.coverView addGestureRecognizer:tapGesture];
    //tableview 索引颜色
    [self.cityTableView setSectionIndexColor:[UIColor colorWithRed:0.988 green:0.012 blue:0.000 alpha:1.00]];
    
    //获取数据源
    WordZoneModel *wordZoneModel = [[WordZoneModel alloc] init];
    self.wordZoneArray = [wordZoneModel getCityArrayOfSection];
}

//取消按钮点击
- (IBAction)cancelClick:(id)sender {
    //模态返回
    [self dismissViewControllerAnimated:YES completion:nil];
}
//几个分组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.wordZoneArray.count;
}
//分组名称
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    WordZoneModel *model = [self.wordZoneArray objectAtIndex:section];
    return model.title;
}
//一组多少行
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    WordZoneModel *model = [self.wordZoneArray objectAtIndex:section];
    return model.cityArray.count;
}
//cell
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"cityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    WordZoneModel *model = [self.wordZoneArray objectAtIndex:[indexPath section]];
    City* city = [model.cityArray objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = city.cityName;
 
    return cell;
}
//cell点击
- (nullable NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WordZoneModel *model = [self.wordZoneArray objectAtIndex:[indexPath section]];
    City* city = [model.cityArray objectAtIndex:[indexPath row]];

    //代理
    [self.delegate selectCity:city];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    return indexPath;
}

//添加索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *indexList = [[NSMutableArray alloc] init];;
    for (WordZoneModel *model in self.wordZoneArray) {
        [indexList addObject:model.title];
    }
    return indexList;
}

//蒙版点击事件
- (void) coverViewClick{
    //关闭键盘
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

#pragma mark - UISearchBar Delegate
//搜索条开始编辑
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    self.coverView.hidden = NO;
    [self.searchBar becomeFirstResponder];
    
    //改变顶部样式 --- 暂时设置uiview 无效
    /*
    self.titleLabel.hidden = YES;
    CGRect srcRect = self.navigationBar.frame;
    srcRect.size.height = 70;
    [self.navigationBar setFrame:srcRect];
     */
}
//搜索条结束编辑
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    self.coverView.hidden = YES;
}
//搜索条文字改变
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if(searchText.length){
        self.searchCityResultVC.view.hidden = NO;
        self.searchCityResultVC.searchCityString = searchText;
    }
    else{
        self.searchCityResultVC.view.hidden = YES;
    }
}
//实现搜索界面的代理
- (void) selectCity:(City *)city{
    [self.delegate selectCity:city];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 搜索结果控制器创建
- (SearchCityResultViewController *)searchCityResultVC{
    //懒加载
    if (_searchCityResultVC == nil) {
        _searchCityResultVC = [[SearchCityResultViewController alloc] init];
        //设置代理
        _searchCityResultVC.delegate = self;
        
        //将搜索结果VC添加到当前控制器中
        [self.view addSubview:_searchCityResultVC.view];
        //添加约束 设置搜素结果控制器尺寸和位置
        [_searchCityResultVC.view autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        //为顶部单独设置边距
        [_searchCityResultVC.view autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.searchBar];
    }
    
    return _searchCityResultVC;
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
