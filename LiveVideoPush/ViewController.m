//
//  ViewController.m
//  LiveVideoPush
//
//  Created by weistek on 2019/2/28.
//  Copyright © 2019 weistek. All rights reserved.
//

#import "ViewController.h"
#import <AlivcLivePusher/AlivcLivePusherHeader.h>
@interface ViewController ()
@property (nonatomic,strong) AlivcLivePushConfig *pushConfig;
@property (nonatomic,strong) AlivcLivePusher *livePusher;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initConfig];
    [self initPusher];
    [self startPush];
}
- (void)initConfig{
    self.pushConfig = [[AlivcLivePushConfig alloc] init];
    self.pushConfig.resolution = AlivcLivePushResolution540P;
    self.pushConfig.cameraType = AlivcLivePushCameraTypeBack;
}
- (void)initPusher{
    self.livePusher = [[AlivcLivePusher alloc] initWithConfig:self.pushConfig];
}
- (void)startPush{
    int result = [self.livePusher startPreview:self.view];
    if (result == 0){
        [self.livePusher startPushWithURL:@"rtmp://192.168.10.107:8889/felix/01"];
        NSLog(@"开始推流");
    }else{
        NSLog(@"初始化失败");
    }
}
@end
