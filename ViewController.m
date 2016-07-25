//
//  ViewController.m
//  Demo
//
//  Created by 白宇翔 on 16/7/22.
//  Copyright © 2016年 白宇翔. All rights reserved.
//
#import "ViewController.h"
#import "MJRefresh.h"
#import "AppToolsDataBase.h"
#import "YXModel.h"
#import "YXModelCell.h"
#import "YXModelFrame.h"
#import "MBProgressHUD.h"
#import "MJRefresh.h"

@interface ViewController ()
@property (nonatomic, strong)NSMutableArray *dataArray;
@property(nonatomic, assign)BOOL isUpLoading;
@property(nonatomic, strong)MBProgressHUD *HUD;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataArray = [NSMutableArray array];
    self.isUpLoading = NO;
    [self addHeaderRefresh];
    //HUD
    self.HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.HUD.labelText = @"loading...";
    self.HUD.opacity = 0.5;
}

#pragma mark - DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YXModelCell *cell = [YXModelCell cellWithTableView:tableView];
    cell.modelFrame = self.dataArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark -- Delegate Method

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YXModelFrame *modelFrame = self.dataArray[indexPath.row];
    return modelFrame.cellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)addHeaderRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.isUpLoading = NO;
        [self GetModelList];
    }];
    [self.tableView.mj_header beginRefreshing];
    
}

#pragma mark -- Data request

-(void)GetModelList {
    
    [AppToolsDataBase getLocalDataWithURL:@"http://thoughtworks-ios.herokuapp.com/facts.json" andSuccessBlock:^(id result) {
        [self.HUD hide:YES];
        NSArray *array =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        NSString *allWorkPath =[[array lastObject] stringByAppendingPathComponent:@"model.plist"];
        //remove
        [[NSFileManager defaultManager] removeItemAtPath:allWorkPath error:nil];
        //write
        [NSKeyedArchiver archiveRootObject:result toFile:allWorkPath];
        if (self.isUpLoading == NO) {
            [self.dataArray removeAllObjects];
        }
        
        for (NSDictionary *dic in [result objectForKey:@"rows"]) {
            YXModel *model = [YXModel modelWithDict:dic];
            YXModelFrame *modelFrame = [[YXModelFrame alloc] init];
            modelFrame.model = model;
            [self.dataArray addObject:modelFrame];
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    } andErrot:^(id result) {
        [self.HUD hide:YES];
        NSArray *array =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *allWorkPath =[[array lastObject] stringByAppendingPathComponent:@"model.plist"];
        NSArray *allArray = [[NSKeyedUnarchiver unarchiveObjectWithFile:allWorkPath] objectForKey:@"rows"];
        if (self.isUpLoading == NO) {
            
            [self.dataArray removeAllObjects];
        }

        for (NSDictionary *dic in allArray) {
            YXModel *model = [YXModel modelWithDict:dic];
            YXModelFrame *modelFrame = [[YXModelFrame alloc] init];
            modelFrame.model = model;
            [self.dataArray addObject:modelFrame];
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
