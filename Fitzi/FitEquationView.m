//
//  FitziIndexView.m
//  Fitzi
//
//  Created by Sumit Kumar Singh on 29/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "FitEquationView.h"
#import "FitEquation1.h"

@implementation FitEquationView

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PageNumberDidChange" object:self];
    }
    return self;
}

- (IBAction) swipeUpDone:(id) sender
{
    NSLog(@"Swipe Up Done_evolution_add ki aur");
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitEquationView_Additional"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitEquationView_Additional class]])
            fitEquationView_Additional = (FitEquationView_Additional *)object;
    }
    [self addSubview:fitEquationView_Additional];
    fitEquationView_Additional.frame = CGRectMake(0.0, self.bounds.size.height, fitEquationView_Additional.bounds.size.width, fitEquationView_Additional.bounds.size.height);

    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView beginAnimations:@"page transition" context:nil];
                         [UIView setAnimationDuration:2.0];
                         [UIView setAnimationTransition:YES ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:YES];
                         fitEquationView_Additional.frame = self.frame;//CGRectMake(12.0,24.0, equationView1.bounds.size.width, (equationView1.bounds.size.height)-20.0);
                     }];
}

- (IBAction) swipeDownDone:(id) sender
{
    NSLog(@"Swipe Down Done");
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitEquation1"
                                                    owner:self options:nil];
    FitEquation1 *indexView;
    for (id object in bundle) {
        if ([object isKindOfClass:[FitEquation1 class]])
            indexView = (FitEquation1 *)object;
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

- (RichTextEditorFeature)featuresEnabledForRichTextEditor:(RichTextEditor *)richTextEditor
{
	return RichTextEditorFeatureFontSize | RichTextEditorFeatureFont | RichTextEditorFeatureAll;
}


@end
