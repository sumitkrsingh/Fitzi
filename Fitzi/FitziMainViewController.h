//
//  FitziMainViewController.h
//  Fitzi
//
//  Created by Sumit Kumar Singh on 28/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FitziIndexView.h"
#import "CopiedTextVC.h"
#import "UIViewController+MJPopupViewController.h"
#import "FitziCommon.h"
#import "MenuCustomCell.h"

@interface FitziMainViewController : UIViewController <UISearchDisplayDelegate, UISearchBarDelegate>
{
    IBOutlet UIView *targetView;
    FitziIndexView *indexView;
    UIPopoverController *popoverController;
    CopiedTextVC *copiedTxtPopverVC;
    __weak IBOutlet UIButton *btnShowPopover;
    IBOutlet UILabel *lblCurrentPage;
    __weak IBOutlet UIView *circularContainerView;
}
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic) NSMutableArray *allData;
@property (nonatomic) NSMutableArray *searchResults;

- (IBAction)moveBackToHomePage:(id)sender;
- (IBAction)exitFromApplication:(id)sender;
- (IBAction)btnSearchAction:(id)sender;
- (void) setPageNumber:(NSNotification *) notification;
- (IBAction)btnCircularMentSeleted:(id)sender;
- (IBAction)createMyNotes:(id)sender;
- (IBAction)showMyHighlights:(id)sender;
- (IBAction)showMyUnderlines:(id)sender;

@end
