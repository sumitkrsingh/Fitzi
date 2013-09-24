//
//  FitziIndexView.m
//  Fitzi
//
//  Created by Sumit Kumar Singh on 29/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "FitziProcessEvaluation5.h"
#import "FitziProcessEvaluation4.h"
#import <QuartzCore/QuartzCore.h>

@implementation FitziProcessEvaluation5

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PageNumberDidChange" object:self];
    }
    return self;
}

- (void) awakeFromNib
{
    [super awakeFromNib];

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}*/


- (IBAction) swipeUpDone:(id) sender
{
    NSLog(@"Swipe Up Done");
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziProcessEvaluation6"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitziProcessEvaluation6 class]])
            nextView = (FitziProcessEvaluation6 *)object;
    }
    [self addSubview:nextView];
    nextView.frame = CGRectMake(0.0, self.bounds.size.height, nextView.bounds.size.width, nextView.bounds.size.height);
    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView beginAnimations:@"page transition" context:nil];
                         [UIView setAnimationDuration:2.0];
                         [UIView setAnimationTransition:YES ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:YES];
                         nextView.frame = self.frame;//CGRectMake(12.0,24.0, equationView1.bounds.size.width, (equationView1.bounds.size.height)-20.0);
                     }];
}

- (IBAction) swipeDownDone:(id) sender
{
    NSLog(@"Swipe Down Done");
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziProcessEvaluation4"
                                                    owner:self options:nil];
    FitziProcessEvaluation4 *indexView;
    for (id object in bundle) {
        if ([object isKindOfClass:[FitziProcessEvaluation4 class]])
            indexView = (FitziProcessEvaluation4 *)object;
    }
    [self addSubview:indexView];
    indexView.frame = CGRectMake(0.0, self.bounds.size.height, indexView.bounds.size.width, indexView.bounds.size.height);
    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView beginAnimations:@"page transition" context:nil];
                         [UIView setAnimationDuration:2.0];
                         [UIView setAnimationTransition:NO ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:YES];
                         indexView.frame = self.frame;//CGRectMake(12.0,24.0, equationView1.bounds.size.width, (equationView1.bounds.size.height)-20.0);
                     }];
}


-(IBAction)buttonClicked:(id)sender
{
    player = [[MPMoviePlayerController alloc] init];
    
    UIViewVideoBG.layer.cornerRadius    =   10.0;
    
    [UIViewVideoBG addSubview: player.view];
    [self createPlayer];
}

- (void)createPlayer
{
    
    NSURL *movieURL=[[NSURL alloc] init];
    
    movieURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"videoofCapturingPhase" ofType:@"mp4"]];
    
    if(movieURL==nil)
        
    {
        UIAlertView *uia = [[UIAlertView alloc] initWithTitle:@"" message:@"Video not available." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [uia show];

    }
    
    else
        
    {
        [player.view removeFromSuperview];
        
        player.contentURL = movieURL;
        
        [player prepareToPlay];
        
        [player.view setFrame: CGRectMake(0.0, 0.0, UIViewVideoBG.frame.size.width, UIViewVideoBG.frame.size.height)];  // player's frame must match parent's
        
        [player setFullscreen:NO];
        
        [UIViewVideoBG addSubview: player.view];
        
        [player play];
        
    }
}

@end
