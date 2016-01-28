//
//  SearchCityResultViewController.m
//  clock
//
//  Created by Mac on 16/1/24.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "SearchCityResultViewController.h"
#import "WordZoneModel.h"

@interface SearchCityResultViewController ()

@property (strong, nonatomic) NSArray* citiesArray;
@property (strong, nonatomic) NSArray* searchRelustArray;
@property Boolean isSelect;

@end

@implementation SearchCityResultViewController

- (SearchCityResultViewController *) init{
    self = [super init];
    if (self) {
        self.searchCityString = [[NSString alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchRelustArray = [[NSArray alloc] init];
}

- (void) setSearchCityString:(NSString *)searchCityString{
    _searchCityString = [searchCityString lowercaseString];
    
    if (self.citiesArray == nil) {
        self.citiesArray = [[[City alloc] init] getCityArray];
    }
    
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (City* city in self.citiesArray) {
        NSString *cityName = [city.cityName lowercaseString];
        if ([cityName containsString:_searchCityString]) {
            [array addObject:city];
        }
    }
    
    self.searchRelustArray = array;
    
    [[self parentViewController] dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchRelustArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *str = @"cityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    City* city = [self.searchRelustArray objectAtIndex:indexPath.row];
    cell.textLabel.text = city.cityName;
    
    return cell;
}

//select cell
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [_delegate selectCity:[_searchRelustArray objectAtIndex:indexPath.row]];
    return indexPath;
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
