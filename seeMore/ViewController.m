//
//  ViewController.m
//  seeMore
//
//  Created by zhangrongwu on 2018/5/21.
//  Copyright © 2018年 ENN. All rights reserved.
//

#import "ViewController.h"
#import "YYMoreViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(10, 55,  2 * 30, 50);
    [btn setTitle:@"打开" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)BtnClick {
    YYMoreViewController *vc = [[YYMoreViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
