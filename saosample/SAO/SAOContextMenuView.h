//
//  SAOContextMenuView.h
//  saosample
//
//  Created by 秋山 高弘 on 2014/02/06.
//  Copyright (c) 2014年 Silver Frontier. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SAOContextMenuViewDelegate;

@interface SAOContextMenuView : UIView
<UITableViewDataSource,UITableViewDelegate>
{
    __strong NSMutableArray* _menuItems;
    __strong NSMutableDictionary* _subMenuItems;
    
    __strong NSString* _selectedItem;
    
    int _counter;
    
    UITableView* _tableView;
    UIView* _subMenuView;
    NSArray* _items;
    
    UIImageView* _downArrow;
    UIImageView* _upArrow;
    UIImageView* _leftArrow;
    UIImageView* _rightArrow;
}
@property(nonatomic,weak)id<SAOContextMenuViewDelegate> delegate;

@property(nonatomic,assign)BOOL isVertical;

@property(nonatomic,strong)UITableView* tableView;

-(void)addItemWithTitle:(NSString*)title forKey:(NSString*)forKey;
-(void)addItemWithIcon:(UIImage*)icon forKey:(NSString*)forKey;
-(void)addSubMenuItemWithTitle:(NSString*)title icon:(UIImage*)icon forKey:(NSString*)key;

-(void)createMenu;
-(void)showMenu:(CGPoint)point;
-(void)hideMenu;

@end

@protocol SAOContextMenuViewDelegate <NSObject>
@required
-(void)contextMenuView:(SAOContextMenuView*)view didSelectedItemAtIndex:(NSInteger)index forKey:(NSString*)key;
@end
