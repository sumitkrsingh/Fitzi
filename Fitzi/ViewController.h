//
//  ViewController.h
//  Fitzi
//
//  Created by Sumit Kumar Singh on 28/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FitziMainViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController
{
    NSArray *animationImages;
}
@property (strong, nonatomic) IBOutlet UIImageView *calibrationImageView;
@property (strong,nonatomic)  MPMoviePlayerController *theMovie;

- (void)swipeDownToNextScreen:(id)sender;

@end
