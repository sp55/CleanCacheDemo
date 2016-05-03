//
//  ViewController.m
//  CleanCacheDemo
//
//  Created by admin on 16/5/3.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "ViewController.h"
#import "CleanCachesHelper.h"

@interface ViewController ()
@property(strong,nonatomic)UILabel *testLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _testLabel=[[UILabel alloc]initWithFrame:CGRectMake(50, 100, 100, 40)];
    _testLabel.backgroundColor=[UIColor blackColor];
    _testLabel.textColor=[UIColor whiteColor];
    _testLabel.text = [NSString stringWithFormat:@"%.1fMB", [CleanCachesHelper folderSizeAtPath:[CleanCachesHelper getCachesPath:@"Caches"]]];
    [self.view addSubview:_testLabel];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [CleanCachesHelper cleanCaches:[CleanCachesHelper getCachesPath:@"Caches"]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
