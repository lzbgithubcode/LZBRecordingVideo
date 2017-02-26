//
//  ViewController.m
//  LZBRecordingVideo
//
//  Created by Apple on 2017/2/26.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "LZBRecordVideoVC.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *recordingButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.recordingButton];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.recordingButton.center = self.view.center;
    self.recordingButton.bounds = CGRectMake(0, 0, 100, 40);
}

- (void)recordingButtonClick
{
     LZBRecordVideoVC  *vc = [[LZBRecordVideoVC alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - lazy
- (UIButton *)recordingButton
{
  if(_recordingButton == nil)
  {
      _recordingButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [_recordingButton setTitle:@"录制视频" forState:UIControlStateNormal];
      [_recordingButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
      [_recordingButton addTarget:self action:@selector(recordingButtonClick) forControlEvents:UIControlEventTouchUpInside];
      _recordingButton.backgroundColor = [UIColor yellowColor];
  }
    return _recordingButton;
}

@end
