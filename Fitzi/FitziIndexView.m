//
//  FitziIndexView.m
//  Fitzi
//
//  Created by Sumit Kumar Singh on 29/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "FitziIndexView.h"

@implementation FitziIndexView

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
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitEvaluationView"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitEvaluationView class]])
            evaluationView = (FitEvaluationView *)object;
    }
    [self addSubview:evaluationView];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:2.0];
    [UIView commitAnimations];
}

- (IBAction) swipeDownDone:(id) sender
{
    NSLog(@"Swipe Down Done");
}

@end
