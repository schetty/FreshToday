//
//  ItemTableViewCell.m
//  FreshToday
//
//  Created by naomi schettini on 2016-10-03.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "ItemTableViewCell.h"
#import <Parse/Parse.h>
#import "User.h"
#import "Item.h"



@implementation ItemTableViewCell





- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




- (IBAction)favoriteItemButtonPressed:(UIButton *)sender{
    
    if (self.delegate /* && [self.delegate respondsToSelector:@selector(didClickOnCellAtIndex:_cellIndex withItemCell:self)] */) {
        [self.delegate didClickOnCellAtIndex:self.cellIndex withItemCell:self];
    }
}

@end
