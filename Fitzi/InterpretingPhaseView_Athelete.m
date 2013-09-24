//
//  InterpretingPhaseView_Athelete.m
//  Fitzi
//
//  Created by MacBook on 04/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "InterpretingPhaseView_Athelete.h"
#import "InterpretingPhaseView1.h"

@implementation InterpretingPhaseView_Athelete

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
    NSLog(@"Swipe Up Done_ inter");
    
   NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"InterpretingPhaseView_Lifestyle"
                                                        owner:self options:nil];
        for (id object in bundle) {
            if ([object isKindOfClass:[InterpretingPhaseView_Lifestyle class]])
                lifeStyle = (InterpretingPhaseView_Lifestyle *)object;
        }
        [self addSubview:lifeStyle];
        lifeStyle.frame = CGRectMake(0.0, self.bounds.size.height, lifeStyle.bounds.size.width, lifeStyle.bounds.size.height);
        [UIView animateWithDuration:1.0
                         animations:^{
                             [UIView beginAnimations:@"page transition" context:nil];
                             [UIView setAnimationDuration:2.0];
                             [UIView setAnimationTransition:YES ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:YES];
                             lifeStyle.frame = self.frame; // its final location
                         }];
}

- (IBAction) swipeDownDone:(id) sender
{
    NSLog(@"Swipe Down Done");
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"InterpretingPhaseView1"
                                                    owner:self options:nil];
    InterpretingPhaseView1 *indexView;
    for (id object in bundle) {
        if ([object isKindOfClass:[InterpretingPhaseView1 class]])
            indexView = (InterpretingPhaseView1 *)object;
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
