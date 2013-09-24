//
//  FitziMainViewController.m
//  Fitzi
//
//  Created by Sumit Kumar Singh on 28/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "FitziMainViewController.h"

@interface FitziMainViewController ()

@end

@implementation FitziMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.allData = [NSMutableArray arrayWithCapacity:[[FitziCommon displayContent] count]];
    self.allData = [[FitziCommon displayContent] mutableCopy];
    for (UIView *subview in self.searchBar.subviews)
    {
        if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
        {
            [subview removeFromSuperview];
            break;
        }
    }
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(setPageNumber:)
                                                 name:@"PageNumberDidChange"
                                               object:nil];
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziIndexView"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitziIndexView class]])
            indexView = (FitziIndexView *)object;
    }
    indexView.frame = CGRectMake(0, 0, indexView.frame.size.width, indexView.frame.size.height);
    [targetView addSubview:indexView];
	// Do any additional setup after loading the view.
   

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)moveBackToHomePage:(id)sender
{
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziIndexView"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitziIndexView class]])
            indexView = (FitziIndexView *)object;
    }
    [targetView addSubview:indexView];
    indexView.frame = CGRectMake(0, 0, indexView.frame.size.width, indexView.frame.size.height);
}

- (IBAction)exitFromApplication:(id)sender
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Confirmation"
                                                    message:@"Do you want to exit?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
    [alert show];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != 0)  // 0 == the cancel button
    {
        //home button press programmatically
        UIApplication *app = [UIApplication sharedApplication];
        [app performSelector:@selector(suspend)];
        
        //wait 2 seconds while app is going background
        [NSThread sleepForTimeInterval:2.0];
        
        //exit app when app is in background
        exit(0);
    }
}

- (IBAction)btnSearchAction:(id)sender
{
    NSLog(@"btnSearchAction Clicked..");
    
    NSLog(@"Got Search Text Source.. %@",[FitziCommon displayContent]);
}

- (IBAction)btnPasteTextAction:(id)sender
{
    NSLog(@"btnPasteTextAction Clicked..");
    copiedTxtPopverVC = [[CopiedTextVC alloc] initWithNibName:@"CopiedTextVC" bundle:[NSBundle mainBundle]];
    copiedTxtPopverVC.screenTag = 2;
    popoverController = [[UIPopoverController alloc] initWithContentViewController:copiedTxtPopverVC];
    popoverController.popoverContentSize = CGSizeMake(700.0, 500.0);
//    if ([popoverController isPopoverVisible]) {
//        [popoverController dismissPopoverAnimated:YES];
//    } else {
//        CGRect popRect = CGRectMake(btnShowPopover.frame.origin.x,
//                                    btnShowPopover.frame.origin.y,
//                                    btnShowPopover.frame.size.width,
//                                    btnShowPopover.frame.size.height);
//        
//        [popoverController presentPopoverFromRect:popRect
//                                           inView:self.view
//                         permittedArrowDirections:UIPopoverArrowDirectionUp
//                                         animated:YES];
//    }
    [self presentPopupViewController:copiedTxtPopverVC animationType:0];
}

- (void)viewDidUnload {
    btnShowPopover = nil;
    lblCurrentPage = nil;
    circularContainerView = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation ==UIInterfaceOrientationLandscapeRight) {
        return YES;
    }
    else
        return NO;
}

- (void) setPageNumber:(NSNotification *) notification
{
    NSLog(@"Recd notification Now...");
    UIView *senderView = [notification object];
    lblCurrentPage.text = [NSString stringWithFormat:@"%d",[senderView tag]];
}

- (IBAction)btnCircularMentSeleted:(id)sender
{
    if(circularContainerView.isHidden)
    {
        circularContainerView.hidden = FALSE;
        [self.view bringSubviewToFront:circularContainerView];
    }
    else
    {
        circularContainerView.hidden = TRUE;
        [self.view sendSubviewToBack:circularContainerView];
    }
}

- (IBAction)createMyNotes:(id)sender
{
    copiedTxtPopverVC = [[CopiedTextVC alloc] initWithNibName:@"CopiedTextVC" bundle:[NSBundle mainBundle]];
    copiedTxtPopverVC.screenTag = [sender tag];
    [copiedTxtPopverVC.pasteTextView setEditable:TRUE];
    popoverController = [[UIPopoverController alloc] initWithContentViewController:copiedTxtPopverVC];
    popoverController.popoverContentSize = CGSizeMake(700.0, 500.0);
//    if ([popoverController isPopoverVisible]) {
//        [popoverController dismissPopoverAnimated:YES];
//    } else {
//        CGRect popRect = CGRectMake([sender frame].origin.x,
//                                    [sender frame].origin.y,
//                                    [sender frame].size.width,
//                                    [sender frame].size.height);
//        
//        [popoverController presentPopoverFromRect:popRect
//                                           inView:self.view
//                         permittedArrowDirections:UIPopoverArrowDirectionUp
//                                         animated:YES];
//    }
    [self presentPopupViewController:copiedTxtPopverVC animationType:0];
}

- (IBAction)showMyHighlights:(id)sender
{
    copiedTxtPopverVC = [[CopiedTextVC alloc] initWithNibName:@"CopiedTextVC" bundle:[NSBundle mainBundle]];
    copiedTxtPopverVC.screenTag = [sender tag];
    popoverController = [[UIPopoverController alloc] initWithContentViewController:copiedTxtPopverVC];
    popoverController.popoverContentSize = CGSizeMake(700.0, 500.0);
//    if ([popoverController isPopoverVisible]) {
//        [popoverController dismissPopoverAnimated:YES];
//    } else {
//        CGRect popRect = CGRectMake([sender frame].origin.x,
//                                    [sender frame].origin.y,
//                                    [sender frame].size.width,
//                                    [sender frame].size.height);
//        
//        [popoverController presentPopoverFromRect:popRect
//                                           inView:self.view
//                         permittedArrowDirections:UIPopoverArrowDirectionUp
//                                         animated:YES];
//    }
    [self presentPopupViewController:copiedTxtPopverVC animationType:0];
}

- (IBAction)showMyUnderlines:(id)sender
{
    copiedTxtPopverVC = [[CopiedTextVC alloc] initWithNibName:@"CopiedTextVC" bundle:[NSBundle mainBundle]];
    copiedTxtPopverVC.screenTag = [sender tag];
    popoverController = [[UIPopoverController alloc] initWithContentViewController:copiedTxtPopverVC];
    popoverController.popoverContentSize = CGSizeMake(700.0, 500.0);
//    if ([popoverController isPopoverVisible]) {
//        [popoverController dismissPopoverAnimated:YES];
//    } else {
//        CGRect popRect = CGRectMake([sender frame].origin.x,
//                                    [sender frame].origin.y,
//                                    [sender frame].size.width,
//                                    [sender frame].size.height);
//        
//        [popoverController presentPopoverFromRect:popRect
//                                           inView:self.view
//                         permittedArrowDirections:UIPopoverArrowDirectionUp
//                                         animated:YES];
//    }
    [self presentPopupViewController:copiedTxtPopverVC animationType:0];
}


#pragma mark - UITableView data source and delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	/*
	 If the requesting table view is the search display controller's table view, return the count of
     the filtered list, otherwise return the count of the main list.
	 */
        return [self.searchResults count];

}

- (CGFloat)tableView:(UITableView *)aTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{  
    return 100.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CustomCellIdentifier = @"MenuCustomCell";
    MenuCustomCell *cell = (MenuCustomCell *)[tableView dequeueReusableCellWithIdentifier: CustomCellIdentifier];
    
    if (cell == nil) { NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MenuCustomCell"
                                                                    owner:self options:nil];
        for (id oneObject in nib) if ([oneObject isKindOfClass:[MenuCustomCell class]])
            cell = (MenuCustomCell *)oneObject;
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    NSString *pageNum = [[self.searchResults objectAtIndex:indexPath.row] valueForKey:@"pagenum"];
    cell.menuText.text = [NSString stringWithFormat:@"Page: %@",pageNum];
    cell.contentText.text = [[self.searchResults objectAtIndex:indexPath.row] valueForKey:@"screentext"];
    return cell;
}

#pragma mark - UISearchDisplayController Delegate Methods

-(void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if(searchText.length == 0)
    {
        self.searchResults = self.allData;
        [self.searchDisplayController.searchResultsTableView reloadData];
    }
    else
    {
        self.searchResults = [[NSMutableArray alloc] init];
        
        for (NSDictionary* dict in self.allData)
        {
            NSRange nameRange = [[dict valueForKey:@"screentext"] rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(nameRange.location != NSNotFound)
            {
                [self.searchResults addObject:dict];
            }
        }
    }
    
    [self.searchDisplayController.searchResultsTableView reloadData];

}

@end
