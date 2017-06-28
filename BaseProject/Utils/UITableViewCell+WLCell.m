//
//  UITableViewCell+WLCell.m
//  Wanlan
//
//  Created by 瓦栏 on 16/9/20.
//  Copyright © 2016年 Wanlan. All rights reserved.
//

#import "UITableViewCell+WLCell.h"

@implementation UITableViewCell (WLCell)

-(void)awakeFromNib{
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

@end
