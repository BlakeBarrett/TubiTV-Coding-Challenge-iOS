//
//  GifPlayerViewController.h
//  Tubi TV Blake Challenge
//
//  Created by Blake Barrett on 2/17/19.
//  Copyright © 2019 Blake Barrett. All rights reserved.
//

#ifndef GifPlayerViewController_h
#define GifPlayerViewController_h

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface GifPlayerViewController : UIViewController

-(void)play:(NSString *)url;

@end

#endif /* GifPlayerViewController_h */
