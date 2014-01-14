//
//  ELViewController.m
//  NetEasyLikeNavigation
//
//  Created by ZhouQuan on 14-1-13.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import "ELViewController.h"
#import "ELHeaderView.h"
@interface ELViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, weak) ELHeaderView *headerView;
@end

@implementation ELViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    ELHeaderView *headerView = [[ELHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)backGroudImageURL:@"http://img3.douban.com/view/photo/photo/public/p2162936775.jpg" headerImageURL:@"http://cdn1.techbang.com.tw/system/images/131770/original/7885e4884b1d15c67c04778d1311e5de.png?1377163177" title:@"App Store" subTitle:@"Purchase what you want"];
    headerView.viewController = self;
    headerView.scrollView = self.tableView;
    [self.view addSubview:headerView];
    _headerView = headerView;
	// Do any additional setup after loading the view, typically from a nib.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ELViewControllerCellIdentifier"];
    self.tableView.delegate = self;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ELViewControllerCellIdentifier" forIndexPath:indexPath];
    
    [cell.textLabel setText:@"text Label"];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
