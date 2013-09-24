//
//  FitEquationView_Additional.m
//  Fitzi
//
//  Created by MacBook on 11/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "FitEquationView_Additional.h"
#import "FitEquationView.h"

@implementation FitEquationView_Additional

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
    NSLog(@"fit equ view add mai right");
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitEquationView"
                                                    owner:self options:nil];
    FitEquationView *indexView;
    for (id object in bundle) {
        if ([object isKindOfClass:[FitEquationView class]])
            indexView = (FitEquationView *)object;
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
- (IBAction) swipeDownDone:(id) sender
{
    NSLog(@"fit equ view add mai left");
    
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziProcessEvaluation"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitziProcessEvaluation class]])
            fitziProcessEvaluation = (FitziProcessEvaluation *)object;
    }
    [self addSubview:fitziProcessEvaluation];
    fitziProcessEvaluation.frame = CGRectMake(0.0, self.bounds.size.height, fitziProcessEvaluation.bounds.size.width, fitziProcessEvaluation.bounds.size.height);
    
    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView beginAnimations:@"page transition" context:nil];
                         [UIView setAnimationDuration:2.0];
                         [UIView setAnimationTransition:YES ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:YES];
                         fitziProcessEvaluation.frame = self.frame;//CGRectMake(12.0,24.0, equationView1.bounds.size.width, (equationView1.bounds.size.height)-20.0);
                     }];
}

- (RichTextEditorFeature)featuresEnabledForRichTextEditor:(RichTextEditor *)richTextEditor
{
	return RichTextEditorFeatureFontSize | RichTextEditorFeatureFont | RichTextEditorFeatureAll;
}


@end
