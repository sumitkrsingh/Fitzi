//
//  FitziProcessEvaluation10.m
//  Fitzi
//
//  Created by MacBook on 06/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "FitziProcessEvaluation10.h"
#import "FitziProcessEvaluation9.h"

@implementation FitziProcessEvaluation10

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PageNumberDidChange" object:self];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (IBAction) swipeUpDone:(id) sender
{
    NSLog(@"Swipe Up Done");
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitEvolutionView11"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitEvolutionView11 class]])
            fitEvolutionView11 = (FitEvolutionView11 *)object;
    }
    [self addSubview:fitEvolutionView11];
    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView beginAnimations:@"page transition" context:nil];
                         [UIView setAnimationDuration:2.0];
                         [UIView setAnimationTransition:YES ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:YES];
                         fitEvolutionView11.frame = self.frame; // its final location
                     }];
}

- (IBAction) swipeDownDone:(id) sender
{
    NSLog(@"Swipe Down Done");
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziProcessEvaluation9"
                                                    owner:self options:nil];
    FitziProcessEvaluation9 *indexView;
    for (id object in bundle) {
        if ([object isKindOfClass:[FitziProcessEvaluation9 class]])
            indexView = (FitziProcessEvaluation9 *)object;
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

@end
