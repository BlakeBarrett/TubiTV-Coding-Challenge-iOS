//
//  GifPlayerViewController.m
//  Tubi TV Blake Challenge
//
//  Created by Blake Barrett on 2/17/19.
//  Copyright © 2019 Blake Barrett. All rights reserved.
//

#import "GifPlayerViewController.h"

@interface GifPlayerViewController()

@end

@implementation GifPlayerViewController

NSString *urlString;

AVPlayer *player;
AVPlayerLayer *playerLayer;

-(void)play:(NSString *)url {
    urlString = url;
}

-(void)viewDidLoad {
    // TODO: re-implement this in Obj-C
    // https://github.com/BlakeBarrett/stchy/blob/master/stchy/Controllers/DetailViewController.swift
    // Update: Thanks me from the past!
    
    [self addGestureRecognizer];
    
    [self prepareVideoPlayer];
}

- (void)viewWillTransitionToSize:(CGSize)size
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    [self prepareVideoPlayer];
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    playerLayer.frame = rect;
}

-(void)addGestureRecognizer {
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)];
    singleTap.numberOfTapsRequired = 1;
    [self.view setUserInteractionEnabled:YES];
    [self.view addGestureRecognizer:singleTap];
}

-(void)onTap{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)prepareVideoPlayer {
    
    // turn the url NSString into a real NSURL
    NSURL *url = [NSURL URLWithString:urlString];
    
    // prepare the player
    player = [AVPlayer playerWithURL:url];
    [player setMuted:false];
    player.automaticallyWaitsToMinimizeStalling = true;
    
    
    // prepare the layer the player plays in
    if (playerLayer != Nil) {
        [playerLayer removeFromSuperlayer];
    }
    playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    playerLayer.frame = self.view.frame;
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    [self.view.layer addSublayer:playerLayer];
    
    // listen for playback to complete
    [NSNotificationCenter.defaultCenter addObserverForName:AVPlayerItemDidPlayToEndTimeNotification
                                                    object:player.currentItem
                                                     queue:NSOperationQueue.mainQueue
                                                usingBlock:^(NSNotification * _Nonnull note) {
                                                    // loop
                                                    [self playVideo];
                                                }];
    
    // start playing
    [self playVideo];
}

-(void)playVideo{
    // goto the beginning
    [player seekToTime:kCMTimeZero];
    [player play];
}

@end

