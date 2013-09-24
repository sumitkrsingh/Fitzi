//
//  FitEquation1.m
//  Fitzi
//
//  Created by MacBook on 04/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "FitEquation1.h"

@implementation FitEquation1

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
    NSLog(@"Swipe Up Done_equ1");
    
    
}

- (IBAction) swipeDownDone:(id) sender
{
    NSLog(@"Swipe Down Done");
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitEquationView"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitEquationView class]])
            equationView = (FitEquationView *)object;
    }
    [self addSubview:equationView];
    [UIView animateWithDuration:1.0
                     animations:^{
                        
                         
                         equationView.frame = self.frame;
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
