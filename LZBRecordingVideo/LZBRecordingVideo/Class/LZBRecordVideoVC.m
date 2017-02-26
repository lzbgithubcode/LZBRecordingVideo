//
//  LZBRecordVideoVC.m
//  LZBRecordingVideo
//
//  Created by Apple on 2017/2/26.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "LZBRecordVideoVC.h"
#import "LZBRecordVideoTool.h"

@interface LZBRecordVideoVC ()

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UIButton *flashButton;
@property (nonatomic, strong) UIButton *cameraButton;
@property (nonatomic, strong) UIButton *recordingButton;
@property (nonatomic, strong) UIView *containerView;

@property (strong,nonatomic) AVCaptureVideoPreviewLayer *captureVideoPreviewLayer;//相机拍摄预览图层
@property (nonatomic, strong) LZBRecordVideoTool *videoTool;
@end

@implementation LZBRecordVideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
    [self setupSubView];
    [self setupCaptureSession];
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    self.topView.frame = CGRectMake(0, 0, width, 80);
    self.recordingButton.center = CGPointMake(width *0.5, height - self.recordingButton.bounds.size.height);
    
    CGFloat margin =  (width - (self.topView.subviews.count *self.cameraButton.bounds.size.width))/self.topView.subviews.count;
    for (NSInteger i = 0; i < self.topView.subviews.count; i++)
    {
        UIButton *button = self.topView.subviews[i];
        CGPoint center = button.center;
        center.y = self.topView.bounds.size.height * 0.5;
        center.x = margin + i*(self.cameraButton.bounds.size.width+margin);
        button.center = center;
    }
}


- (void)setupSubView
{
    [self.view addSubview:self.containerView];
    [self.view addSubview:self.topView];
    [self.topView addSubview:self.closeButton];
    [self.topView addSubview:self.flashButton];
    [self.topView addSubview:self.cameraButton];
    [self.view addSubview:self.recordingButton];
}

- (void)setupCaptureSession
{
   self.captureVideoPreviewLayer  =  [self.videoTool previewLayer];
    CALayer *layer=self.containerView.layer;
    layer.masksToBounds=YES;
    self.captureVideoPreviewLayer.frame = layer.bounds;
    [layer addSublayer:self.captureVideoPreviewLayer];
    //开启录制功能
    [self.videoTool startRecordFunction];
}

#pragma mark- action
- (void)closeButtonClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)flashButtonClick
{
  
}

- (void)cameraButtonClick
{

}

- (void)recordingButtonClick
{

}

#pragma mark - lazy
- (UIView *)topView
{
  if(_topView == nil)
  {
      _topView = [UIView new];
      _topView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
  }
    return _topView;
}

- (UIView *)containerView
{
  if(_containerView == nil)
  {
      _containerView = [[UIView alloc]initWithFrame:self.view.bounds];
      _containerView.backgroundColor = [UIColor greenColor];
  }
    return _containerView;
}

- (UIButton *)closeButton
{
   if(_closeButton == nil)
   {
       _closeButton = [ UIButton buttonWithType:UIButtonTypeCustom];
       [_closeButton setImage:[UIImage imageNamed:@"shortvideo_button_close"] forState:UIControlStateNormal];
        _closeButton.bounds = CGRectMake(0, 0, 50, 50);
       _closeButton.layer.cornerRadius =  _closeButton.bounds.size.width * 0.5;
       _closeButton.layer.masksToBounds = YES;
       [_closeButton addTarget:self action:@selector(closeButtonClick) forControlEvents:UIControlEventTouchUpInside];
   }
    return _closeButton;
}

- (UIButton *)flashButton
{
    if(_flashButton == nil)
    {
        _flashButton = [ UIButton buttonWithType:UIButtonTypeCustom];
        [_flashButton setImage:[UIImage imageNamed:@"room_pop_up_lamp"] forState:UIControlStateNormal];
         _flashButton.bounds = CGRectMake(0, 0, 50, 50);
        _flashButton.layer.cornerRadius =  _flashButton.bounds.size.width * 0.5;
        _flashButton.layer.masksToBounds = YES;
        [_flashButton addTarget:self action:@selector(flashButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _flashButton;
}

- (UIButton *)cameraButton
{
    if(_cameraButton == nil)
    {
        _cameraButton = [ UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraButton setImage:[UIImage imageNamed:@"shortvideo_download_5_refresh"] forState:UIControlStateNormal];
        _cameraButton.bounds = CGRectMake(0, 0, 50, 50);
        _cameraButton.layer.cornerRadius =  _cameraButton.bounds.size.width * 0.5;
        _cameraButton.layer.masksToBounds = YES;
        [_cameraButton addTarget:self action:@selector(cameraButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraButton;
}

- (UIButton *)recordingButton
{
    if(_recordingButton == nil)
    {
        _recordingButton = [ UIButton buttonWithType:UIButtonTypeCustom];
        [_recordingButton setImage:[UIImage imageNamed:@"room_task_video_start_fold"] forState:UIControlStateNormal];
        _recordingButton.bounds = CGRectMake(0, 0, 50, 50);
        _recordingButton.layer.cornerRadius =  _recordingButton.bounds.size.width * 0.5;
        _recordingButton.layer.masksToBounds = YES;
        [_recordingButton addTarget:self action:@selector(recordingButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _recordingButton;
}

- (LZBRecordVideoTool *)videoTool
{
  if(_videoTool == nil)
  {
      _videoTool = [[LZBRecordVideoTool alloc]init];
  }
    return _videoTool;
}


@end
