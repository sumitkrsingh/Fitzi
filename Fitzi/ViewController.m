//
//  ViewController.m
//  Fitzi
//
//  Created by Sumit Kumar Singh on 28/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    animationImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"Cal01.jpg"],[UIImage imageNamed:@"Cal02.jpg"],[UIImage imageNamed:@"Cal03.jpg"],nil];
//    self.calibrationImageView.animationImages = animationImages;
//    self.calibrationImageView.animationDuration = 1;
//    self.calibrationImageView.animationRepeatCount = 3;
//    [self.calibrationImageView startAnimating];
//    self.calibrationImageView.image = [UIImage imageNamed:@"Cal04.jpg"];
    [self playMovie];
    //[self performSelector:@selector(swipeDownToNextScreen:) withObject:self afterDelay:1.0];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)swipeDownToNextScreen:(id)sender
{
    NSLog(@"Inside Swipe Guesture..");
    
    UIStoryboard *appstoryBoard = [self storyboard];
    UIViewController *screen = [appstoryBoard instantiateViewControllerWithIdentifier:@"MainScreen"];
    [self presentViewController:screen animated:YES completion:nil];
    
 // OR USE ABOVE.. Both Works
    
    //[self performSegueWithIdentifier:@"MainScreen" sender:sender];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation ==UIInterfaceOrientationLandscapeRight) {
        return YES;
    }
    else
        return NO;
}


- (void)viewDidUnload {
    [self setCalibrationImageView:nil];
    [super viewDidUnload];
}


-(void)playMovie

{
    NSString *moviePath                 =	[[NSBundle mainBundle] pathForResource:@"videoofCapturingPhase" ofType:@"mp4"];
    
    NSURL *movieURL                     =	[NSURL fileURLWithPath:moviePath];
    
    self.theMovie = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
    [self.view addSubview:self.theMovie.view];
    [self.view bringSubviewToFront:self.theMovie.view];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlaybackComplete:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:self.theMovie];
    self.theMovie.scalingMode = MPMovieScalingModeAspectFill;
    self.theMovie.controlStyle	=	MPMovieControlStyleNone;
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    self.theMovie.view.frame = CGRectMake(0, 0, screenBound.size.height, screenBound.size.width);
    self.theMovie.fullscreen = YES;
    
    [self.theMovie play];
    
}



- (void)moviePlaybackComplete:(NSNotification *)notification
{
    MPMoviePlayerController *moviePlayerController = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:moviePlayerController];
    [moviePlayerController.view removeFromSuperview];
    [self performSelector:@selector(swipeDownToNextScreen:) withObject:self afterDelay:0.0];

}

@end
