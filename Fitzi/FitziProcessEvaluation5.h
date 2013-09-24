//
//  FitziIndexView.h
//  Fitzi
//
//  Created by Sumit Kumar Singh on 29/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <QuartzCore/QuartzCore.h>
#import "FitziProcessEvaluation6.h"

@interface FitziProcessEvaluation5 : UIView
{
    FitziProcessEvaluation6 *nextView;
    IBOutlet UIView *UIViewVideoBG;
    MPMoviePlayerController *player;
    

}

@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeUp;
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDown;

- (IBAction) swipeUpDone:(id) sender;
- (IBAction) swipeDownDone:(id) sender;
- (void)createPlayer;
//- (void)closePlayer;
-(IBAction)buttonClicked:(id)sender;

@end
