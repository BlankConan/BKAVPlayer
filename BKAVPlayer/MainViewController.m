//
//  MainViewController.m
//  BKAVPlayer
//
//  Created by liugangyi on 2017/3/17.
//  Copyright © 2017年 liugangyi. All rights reserved.
//

#import "MainViewController.h"
#import "VideoViewController.h"

@interface MainViewController ()
<UITableViewDelegate,
UITableViewDataSource>

/// dataArray.
@property (nonatomic , strong) NSArray *videoArray;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.videoArray = @[
                        @"http://120.25.226.186:32812/resources/videos/minion_10.mp4",
                        @"http://120.25.226.186:32812/resources/videos/minion_11.mp4",
                        @"https://vpro.allinmd.cn/1509677793878_480_320.mp4?1509643844"
                        ];
    
}


#pragma mark - tableView datasource and delegate


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.videoArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"videoCell"];
    
    cell.textLabel.text = self.videoArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    videoVC.videoUrlStr = self.videoArray[indexPath.row];
    [self.navigationController pushViewController:videoVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
