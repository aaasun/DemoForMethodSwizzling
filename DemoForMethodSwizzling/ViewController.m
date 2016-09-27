//
//  ViewController.m
//  DemoForMethodSwizzling
//
//  Created by wangjw on 16/9/26.
//  Copyright © 2016年 kaolafm. All rights reserved.
//

#import "ViewController.h"
#import "TestModel+Swizzling.h"

@interface ViewController ()

@property (nonatomic ,strong) TestModel *model;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.model = [TestModel new];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.model testFounction];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"xxx");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
