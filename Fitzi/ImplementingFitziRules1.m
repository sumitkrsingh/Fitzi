//
//  ImplementingFitziRules1.m
//  Fitzi
//
//  Created by MacBook on 05/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "ImplementingFitziRules1.h"
#import "InterpretingPhaseFitting4.h"

@implementation ImplementingFitziRules1

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
    NSLog(@"Swipe Up Done_rules1");
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"ImplementingFitziRules2"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[ImplementingFitziRules2 class]])
            rules2 = (ImplementingFitziRules2 *)object;
    }
    [self addSubview:rules2];
    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView beginAnimations:@"page transition" context:nil];
                         [UIView setAnimationDuration:2.0];
                         [UIView setAnimationTransition:YES ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:YES];
                         rules2.frame = self.frame; // its final location
                     }];
}

- (IBAction) swipeDownDone:(id) sender
{
    NSLog(@"Swipe Down Done");
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"InterpretingPhaseFitting4"
                                                    owner:self options:nil];
    InterpretingPhaseFitting4 *indexView;
    for (id object in bundle) {
        if ([object isKindOfClass:[InterpretingPhaseFitting4 class]])
            indexView = (InterpretingPhaseFitting4 *)object;
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
