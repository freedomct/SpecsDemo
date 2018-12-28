


//
//  RunnerVC.m
//  CacheDemo
//
//  Created by FengZi on 21/11/2017.
//  Copyright © 2017 yang. All rights reserved.
//

#import "RunnerVC.h"
#import <CoreMotion/CoreMotion.h>
@interface RunnerVC ()<UIScrollViewDelegate>

typedef void(^myBlock)(void);

@property (nonatomic, strong) CMMotionManager *motionManager;



@end

@implementation RunnerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view endEditing:YES];
    _motionManager = [[CMMotionManager alloc]init];
    //  检测传感器是否可用
    if (![_motionManager isAccelerometerAvailable]) {
         //  fail code
        NSLog(@"传感器失败");
    }
    //  更新频率 100 hz
    _motionManager.accelerometerUpdateInterval = 0.01;
    [_motionManager startAccelerometerUpdates];
    
    [_motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
       
        NSLog(@"error = %@",error);
        
        double x = accelerometerData.acceleration.x;
        double y = accelerometerData.acceleration.y;
        double z = accelerometerData.acceleration.z;
    }];
}


- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(foo:)) {
        return @"";
    }
    return [super forwardingTargetForSelector:aSelector];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
