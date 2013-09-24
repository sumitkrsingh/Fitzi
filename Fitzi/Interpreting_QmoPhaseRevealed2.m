//
//  Interpreting_QmoPhaseRevealed2.m
//  Fitzi
//
//  Created by MacBook on 04/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "Interpreting_QmoPhaseRevealed2.h"
#import "Interpreting_QmoPhaseRevealed1_2.h"

@implementation Interpreting_QmoPhaseRevealed2

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (IBAction) swipeUpDone:(id) sender
{
    NSLog(@"Swipe Up Done_ revealed2_2");
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"Interpreting_QmoPhaseRevealed2_2"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[Interpreting_QmoPhaseRevealed2_2 class]])
            qmo2_2 = (Interpreting_QmoPhaseRevealed2_2 *)object;
    }
    [self addSubview:qmo2_2];
    qmo2_2.frame = CGRectMake(0.0, self.bounds.size.height, qmo2_2.bounds.size.width, qmo2_2.bounds.size.height);
    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView beginAnimations:@"page transition" context:nil];
                         [UIView setAnimationDuration:2.0];
                         [UIView setAnimationTransition:YES ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:YES];
                         qmo2_2.frame = self.frame; // its final location
                     }];
}

- (IBAction) swipeDownDone:(id) sender
{
    NSLog(@"Swipe Down Done");
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"Interpreting_QmoPhaseRevealed1_2"
                                                    owner:self options:nil];
    Interpreting_QmoPhaseRevealed1_2 *indexView;
    for (id object in bundle) {
        if ([object isKindOfClass:[Interpreting_QmoPhaseRevealed1_2 class]])
            indexView = (Interpreting_QmoPhaseRevealed1_2 *)object;
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
