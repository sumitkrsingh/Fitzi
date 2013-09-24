//
//  FitziIndexView.m
//  Fitzi
//
//  Created by Sumit Kumar Singh on 29/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "InterpretingPhaseFitting4.h"
#import "InterpretingPhaseFitting3.h"

@implementation InterpretingPhaseFitting4

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"ImplementingFitziRules1"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[ImplementingFitziRules1 class]])
            rules1 = (ImplementingFitziRules1 *)object;
    }
    [self addSubview:rules1];
    //ImplementingFitziRules1.frame = CGRectMake(0.0, self.bounds.size.height, ImplementingFitziRules1.bounds.size.width, ImplementingFitziRules1.bounds.size.height);
    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView beginAnimations:@"page transition" context:nil];
                         [UIView setAnimationDuration:2.0];
                         [UIView setAnimationTransition:YES ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:YES];
                         rules1.frame = self.frame; // its final location
                     }];
}

- (IBAction) swipeDownDone:(id) sender
{
    NSLog(@"Swipe Down Done");
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"InterpretingPhaseFitting3"
                                                    owner:self options:nil];
    InterpretingPhaseFitting3 *indexView;
    for (id object in bundle) {
        if ([object isKindOfClass:[InterpretingPhaseFitting3 class]])
            indexView = (InterpretingPhaseFitting3 *)object;
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
