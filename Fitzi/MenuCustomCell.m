//
//  CustomCell.m
//  InsertCustomCellOnTableRow
//
//  Created by Kshitiz Ghimire on 3/15/11.
//  Copyright 2011 Javra Software. All rights reserved.
//

#import "MenuCustomCell.h"


@implementation MenuCustomCell

@synthesize contentText,menuText;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


@end
