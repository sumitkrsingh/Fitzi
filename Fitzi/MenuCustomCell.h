//
//  CustomCell.h
//  InsertCustomCellOnTableRow
//
//  Created by Kshitiz Ghimire on 3/15/11.
//  Copyright 2011 Javra Software. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MenuCustomCell : UITableViewCell 
	
@property(nonatomic,retain) IBOutlet UITextView *contentText;
@property(nonatomic,retain) IBOutlet UILabel *menuText;


@end
