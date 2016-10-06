//
//  ViewController.m
//  ARRefreshDemo
//
//  Created by Ari on 16/10/6.
//  Copyright © 2016年 com.Ari. All rights reserved.
//

#import "ViewController.h"
#import "ARRefreshControl.h"
@interface ViewController ()
@property (nonatomic,weak) ARRefreshControl *arRefreshControl;
@property (nonatomic,copy) NSString *cellShowString;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"refreshDemo";
    self.cellShowString = @"原始数据";
    self.tableView.backgroundColor = [UIColor darkGrayColor];
    ARRefreshControl *refreshControl = [[ARRefreshControl alloc] init];
    refreshControl.frame = CGRectMake(0, -44, self.tableView.bounds.size.width, 44);
    self.arRefreshControl = refreshControl;
    [self.tableView addSubview:refreshControl];
    [refreshControl addTarget:self action:@selector(refresh) forControlEvents:(UIControlEventValueChanged)];
}
- (void)refresh {
    static NSInteger times = 0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.cellShowString = [NSString stringWithFormat:@"刷新数据%zd",times];
        [self.tableView reloadData];
        [self.arRefreshControl endRefreshing];
        times++;
    });
}
#pragma mark - 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellid = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellid];
    }
    cell.textLabel.text = self.cellShowString;
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
}

@end
