//
//  FitEquation1_Additional.m
//  Fitzi
//
//  Created by MacBook on 11/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "FitEquation1_Additional.h"
#import "FitEquation1.h"

@implementation FitEquation1_Additional

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PageNumberDidChange" object:self];
    }
    return self;
}

-(void)awakeFromNib
{
      NSLog(@"Add mai aa gaya");
}

//-(IBAction)swipeUpDone:(id)sender
//{
  /*  NSLog(@"Swipe Up Done_equ_add");
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitEquationView"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitEquationView class]])
            fitEquationView = (FitEquationView *) object;
    }
    [self addSubview:fitEquationView];
    fitEquationView.frame = CGRectMake(0.0, self.bounds.size.height, fitEquationView.bounds.size.width, fitEquationView.bounds.size.height);
    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView beginAnimations:@"page transition" context:nil];
                         [UIView setAnimationDuration:2.0];
                         [UIView setAnimationTransition:YES ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:YES];
                         fitEquationView.frame = self.frame;//CGRectMake(12.0,24.0, equationView1.bounds.size.width, (equationView1.bounds.size.height)-20.0);
                     }];*/
//}

- (IBAction) swipeUpDone:(id) sender
{
    NSLog(@"add_ mai right");
    
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

- (IBAction) swipeDownDone:(id) sender
{
     NSLog(@"add_ mai Left");
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitEquationView"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitEquationView class]])
            fitEquationView = (FitEquationView *) object;
    }
    [self addSubview:fitEquationView];
    fitEquationView.frame = CGRectMake(0.0, self.bounds.size.height, fitEquationView.bounds.size.width, fitEquationView.bounds.size.height);
    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView beginAnimations:@"page transition" context:nil];
                         [UIView setAnimationDuration:2.0];
                         [UIView setAnimationTransition:YES ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:YES];
                         fitEquationView.frame = self.frame;//CGRectMake(12.0,24.0, equationView1.bounds.size.width, (equationView1.bounds.size.height)-20.0);
                     }];
}

- (RichTextEditorFeature)featuresEnabledForRichTextEditor:(RichTextEditor *)richTextEditor
{
	return RichTextEditorFeatureFontSize | RichTextEditorFeatureFont | RichTextEditorFeatureAll;
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
