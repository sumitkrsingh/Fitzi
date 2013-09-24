//
//  FitziIndexView.m
//  Fitzi
//
//  Created by Sumit Kumar Singh on 29/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#define POP_TEXT1  @"Can be extremely useful for Trainees as they provide staff set lines that they can use to approach customers with. Typically these are based around; the weather, lunch breaks, and sporting events. To prevent yourself from  falling into the habit of greeting every customer with the same opening line come up with five Fitzi opening comments and present them to your manager."

#define POP_TEXT2  @"GreetingFor more resistant customers, a spontaneous greeting can catch them unawares and help them see staff as more than just a salesperson. Spontaneous greetings can be based on an event that happened that day, what a customer is wearing, or something you have just witnessed in the centre."

#define POP_TEXT3  @": Are conversation starting statements/questions that are designed to relax the customer and build rapport. For example: Replying with ‘That’s okay’ followed by another non sales related comment to encourage conversation – these can be based on current events, weather or appearance."

#import "FitziProcessEvaluation1.h"
#import "FitziProcessEvaluation.h"

@implementation FitziProcessEvaluation1

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
    NSLog(@"Swipe Up Done_mai aa gaya");
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziProcessEvaluation1_Additional"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitziProcessEvaluation1_Additional class]])
            fitziProcessEvaluation1_Additional = (FitziProcessEvaluation1_Additional *)object;
    }
    [self addSubview:fitziProcessEvaluation1_Additional];
    fitziProcessEvaluation1_Additional.frame = CGRectMake(0.0, self.bounds.size.height, fitziProcessEvaluation1_Additional.bounds.size.width, fitzProcessEval1.bounds.size.height);
    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView beginAnimations:@"page transition" context:nil];
                         [UIView setAnimationDuration:2.0];
                         [UIView setAnimationTransition:YES ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:YES];
                         fitziProcessEvaluation1_Additional.frame = self.frame;//CGRectMake(12.0,24.0, equationView1.bounds.size.width, (equationView1.bounds.size.height)-20.0);
                     }];

}

- (IBAction) swipeDownDone:(id) sender
{
    NSLog(@"Swipe Down Done");
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziProcessEvaluation_Additional"
                                                    owner:self options:nil];
    FitziProcessEvaluation_Additional *indexView;
    for (id object in bundle) {
        if ([object isKindOfClass:[FitziProcessEvaluation_Additional class]])
            indexView = (FitziProcessEvaluation_Additional *)object;
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

- (IBAction)showPopUpWithText:(id)sender
{
    [self preparePopupArray];
    PopupView *popupview = [[[NSBundle mainBundle] loadNibNamed:@"PopupView" owner:self options:nil] objectAtIndex:0];
    
    [popupview setPopupString:[popupText objectAtIndex:[sender tag]] andTitle:[popupTitle objectAtIndex:[sender tag]]];
    popupview.frame = CGRectMake(self.bounds.size.width/2 - popupview.bounds.size.width/2, self.bounds.size.height/2 - popupview.bounds.size.height/2, popupview.bounds.size.width, popupview.bounds.size.height);
    [self addSubview:popupview];
}

- (void) preparePopupArray
{
    popupText = [[NSArray alloc] initWithObjects:[NSString stringWithFormat:@"%@",POP_TEXT1],[NSString stringWithFormat:@"%@",POP_TEXT2],[NSString stringWithFormat:@"%@",POP_TEXT3], nil];
    popupTitle = [[NSArray alloc] initWithObjects:[NSString stringWithFormat:@"%@",@"•	Predetermined Greeting "],[NSString stringWithFormat:@"%@",@"•	Spontaneous Greeting"],[NSString stringWithFormat:@"%@",@"•	Follow through comments:"], nil];
}

- (RichTextEditorFeature)featuresEnabledForRichTextEditor:(RichTextEditor *)richTextEditor
{
	return RichTextEditorFeatureFontSize | RichTextEditorFeatureFont | RichTextEditorFeatureAll;
}


@end
