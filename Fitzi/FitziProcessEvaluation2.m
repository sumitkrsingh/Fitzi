//
//  FitziIndexView.m
//  Fitzi
//
//  Created by Sumit Kumar Singh on 29/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "FitziProcessEvaluation2.h"
#import "FitziProcessEvaluation1_Additional.h"

@implementation FitziProcessEvaluation2

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
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziProcessEvaluation3"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitziProcessEvaluation3 class]])
            fitziEvolutionView = (FitziProcessEvaluation3 *)object;
    }
    [self addSubview:fitziEvolutionView];
    fitziEvolutionView.frame = CGRectMake(0.0, self.bounds.size.height, fitziEvolutionView.bounds.size.width, fitziEvolutionView.bounds.size.height);
    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView beginAnimations:@"page transition" context:nil];
                         [UIView setAnimationDuration:2.0];
                         [UIView setAnimationTransition:YES ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:YES];
                         fitziEvolutionView.frame = self.frame;
                     }];
}

- (IBAction) swipeDownDone:(id) sender
{
    NSLog(@"Swipe Down Done");
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziProcessEvaluation1_Additional"
                                                    owner:self options:nil];
    FitziProcessEvaluation1_Additional *indexView;
    for (id object in bundle) {
        if ([object isKindOfClass:[FitziProcessEvaluation1_Additional class]])
            indexView = (FitziProcessEvaluation1_Additional *)object;
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
