//
//  TestModel+Swizzling.m
//  DemoForMethodSwizzling
//
//  Created by wangjw on 16/9/26.
//  Copyright © 2016年 kaolafm. All rights reserved.
//

#import "TestModel+Swizzling.h"
#import <objc/runtime.h>

@implementation TestModel (Swizzling)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        Method methodOld = class_getInstanceMethod(class, NSSelectorFromString(@"testFounction"));
        Method methodnew = class_getInstanceMethod(class, NSSelectorFromString(@"xxz_testFounction"));
        method_exchangeImplementations(methodOld, methodnew);
    });
}

- (void)xxz_testFounction
{
    NSLog(@"xxz_testFounction");
    [self xxz_testFounction];
}

@end
