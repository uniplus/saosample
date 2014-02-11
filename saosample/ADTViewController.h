//
//  ADTViewController.h
//  saosample
//
//  Created by 秋山 高弘 on 2014/02/12.
//  Copyright (c) 2014年 秋山 高弘. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SAOContextMenuView.h"

@interface ADTViewController : UIViewController
{
    SAOContextMenuView* _horizontalContextMenu;
    SAOContextMenuView* _verticalContextMenu;
    
    BOOL _showContextMenu;
}
@end
