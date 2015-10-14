//
//  ViewController.m
//  BING
//
//  Created by yangyao on 15/10/8.
//  Copyright © 2015年 yangyao. All rights reserved.
//

#import "ViewController.h"
#import "BingView.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    BingView *bing = [[BingView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:bing];
}

@end
