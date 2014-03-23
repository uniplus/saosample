//
//  SAOContextMenuView.m
//  saosample
//
//  Created by 秋山 高弘 on 2014/02/06.
//  Copyright (c) 2014年 Silver Frontier. All rights reserved.
//

#import "SAOContextMenuView.h"
#import "SVFCircleView.h"
#import "SVFGenerateImageUtil.h"

@implementation SAOContextMenuView

//-(void)dealloc
//{
//    _selectedItem = nil;
//    _items = nil;
//    
//    [_menuItems release],_menuItems=nil;
//    [_subMenuItems release],_subMenuItems=nil;
//    [_tableView release],_tableView=nil;
//    [_subMenuView release],_subMenuView=nil;
//    
//    [_downArrow release],_downArrow=nil;
//    [_upArrow release],_upArrow=nil;
//    [_leftArrow release],_leftArrow=nil;
//    [_rightArrow release],_rightArrow=nil;
//    
//    [super dealloc];
//}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.hidden     = YES;
    }
    return self;
}

// IB用
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code.
        self.hidden     = YES;
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

-(void)createMenu
{
    float offsetY   = 0.0f;
    float padding   = 5.0f;
    float itemSize  = 46.0f;
    
    for (NSDictionary* dict in _menuItems) {
        NSLog(@"dict[%@]",dict);
        SVFCircleView* itemBtn=nil;
        itemBtn = [SVFCircleView circleViewWithRect:CGRectMake(0, offsetY, itemSize, itemSize)
                                               icon:[dict objectForKey:@"icon"]
                                              title:[dict objectForKey:@"title"]
                                             forKey:[dict objectForKey:@"key"]
                                          textColor:[UIColor whiteColor]
                                      selectedColor:[UIColor orangeColor]
                                       cirecleColor:[UIColor grayColor]
                   ];
        if (itemBtn) {
            [self addSubview:itemBtn];
            offsetY += itemSize + padding;
            
            UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singeTapAction:)];
            [itemBtn addGestureRecognizer:gesture];
        }
    }
    
    [self createSubMenu];
}

-(void)hideMenu
{
    self.hidden         = YES;
    _subMenuView.hidden = YES;
}

-(void)showMenu:(CGPoint)point
{
    self.hidden     = NO;
    float delayTime = 0.0f;
    float offsetY   = 0.0f;
    float offsetX   = 0.0f;
    float padding   = 5.0f;
    float itemSize  = 46.0f;
    self.center     = point;
    
    // 横位置補正
    if (self.superview.bounds.size.width < CGRectGetMaxX(self.frame) - 10) {
        CGPoint sp = point;
        sp.x = self.superview.bounds.size.width - (self.frame.size.width*0.5+10);
        self.center = sp;
    } else if( CGRectGetMinX(self.frame) < 10 ){
        CGPoint sp = point;
        sp.x = self.frame.size.width*0.5+10;
        self.center = sp;
    }
    
    // 縦補正
    if (self.superview.bounds.size.height < CGRectGetMaxY(self.frame) - 5) {
        CGPoint sp = self.center;
        sp.y = self.superview.bounds.size.height - (self.frame.size.height*0.5+5);
        self.center = sp;
    } else if( CGRectGetMinY(self.frame) < 5 ){
        CGPoint sp = self.center;
        sp.y = self.frame.size.height*0.5+5;
        self.center = sp;
    }
    
    _counter            = 0;
    _subMenuView.hidden = YES;

    // 選択解除
    [self selectedItemWithKey:nil];
    
    for (SVFCircleView* subView in [self subviews]) {
        if ([subView isKindOfClass:[SVFCircleView class]]) {
            CGRect startRect=subView.frame;
            startRect.origin.y = -startRect.size.height;
            startRect.origin.x = offsetX;
            
            CGRect endRect   = subView.frame;
            endRect.origin.y = offsetY;
            endRect.origin.x = offsetX;
            
            subView.frame = startRect;
            subView.alpha = 0.0f;
            [UIView animateWithDuration:0.3f
                                  delay:delayTime
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 // アニメーションをする処理
                                 subView.frame = endRect;
                                 subView.alpha = 1.0f;
                             }
                             completion:^(BOOL finished){
                                 // アニメーションが終わった後実行する処理
                                 if (_selectedItem) {
                                     [self animationDidFinish];
                                 }
                             }];
            if (_isVertical) {
                offsetY += itemSize + padding;
            } else {
                offsetX += itemSize + padding;
            }
            delayTime+=0.1f;
        }
    }
}

-(void)animationDidFinish
{
}

-(void)addItemWithTitle:(NSString*)title forKey:(NSString*)forKey
{
    if (!_menuItems) {
        _menuItems = [[NSMutableArray alloc] initWithCapacity:10];
    }
    NSDictionary* dict = @{@"title":title,@"key":forKey};
    [_menuItems addObject:dict];
}

-(void)addItemWithIcon:(UIImage*)icon forKey:(NSString*)forKey
{
    if (!_menuItems) {
        _menuItems = [[NSMutableArray alloc] initWithCapacity:10];
    }
    NSDictionary* dict = @{@"icon":icon,@"key":forKey};
    [_menuItems addObject:dict];
}

-(void)addSubMenuItemWithTitle:(NSString*)title icon:(UIImage*)icon forKey:(NSString*)forKey
{
    if (!_subMenuItems) {
        _subMenuItems = [NSMutableDictionary dictionary];
    }
    
    NSMutableArray* array = [_subMenuItems objectForKey:forKey];
    if (!array) {
        array = [NSMutableArray array];
    }
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    if (icon) {
        [dict setObject:icon forKey:@"icon"];
    }
    if (title) {
        [dict setObject:title forKey:@"title"];
    }
    if (forKey) {
        [dict setObject:forKey forKey:@"key"];
    }
    [array addObject:dict];
    [_subMenuItems setObject:array forKey:forKey];
    NSLog(@"_subMenuItems[%@]",_subMenuItems);
}

-(void)singeTapAction:(UIGestureRecognizer*)sender
{
    SVFCircleView* touchView = (id)[sender view];
    CGPoint touchPoint = [sender locationInView:self.superview];
    NSString* key = touchView.keyStr;
    [self selectedItemWithKey:key];
    _selectedItem = key;
    
    NSArray* array = [_subMenuItems objectForKey:key];
    if (array) {
        CGPoint point;
        if (_isVertical) {
            point = CGPointMake(touchPoint.x,touchView.center.y+self.frame.origin.y);
        } else {
            point = CGPointMake(touchView.center.x+self.frame.origin.x,touchPoint.y);
        }
        [self showSubMenuItem:array point:point];
    } else {
        _subMenuView.hidden=YES;
        [_delegate contextMenuView:self didSelectedItemAtIndex:-1 forKey:key];
    }
}

-(void)selectedItemWithKey:(NSString*)key
{
    for (SVFCircleView* subView in [self subviews]) {
        if ([subView isKindOfClass:[SVFCircleView class]]) {
            if ([subView.keyStr isEqualToString:key]) {
                subView.selected=YES;
            } else {
                subView.selected=NO;
            }
            [subView setNeedsDisplay];
        }
    }
    [self setNeedsDisplay];
}

-(void)deselectedItemWithKey:(SVFCircleView*)targetView
{
    targetView.selected=NO;
    [targetView setNeedsDisplay];
}

-(void)createSubMenu
{
    if (!_subMenuView) {
        if (_isVertical){
            _subMenuView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 115+10, 34*3)];
        } else {
            _subMenuView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 115, 34*3+5)];
        }
        _subMenuView.backgroundColor=[UIColor orangeColor];
    }
    
    if (!_tableView) {
        CGRect tableRect = _subMenuView.bounds;
        if (_isVertical) {
            tableRect.origin.x      += 5;
            tableRect.size.width    -= 5;
        } else {
            tableRect.size.height   -= 5;
        }
        
        _tableView = [[UITableView alloc] initWithFrame:tableRect];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorColor  = [UIColor whiteColor];
        _tableView.delegate     = self;
        _tableView.dataSource   = self;
        _tableView.bounces      = NO;
        _tableView.rowHeight    = 34;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [_tableView setSeparatorInset:UIEdgeInsetsZero];
        }
        [_subMenuView addSubview:_tableView];
    }
    
    if (_isVertical) {
        {
            UIImage* image = [SVFGenerateImageUtil imageForRightArrow:[UIColor orangeColor] rect:CGRectMake(0.0f, 0.0f, 10.0f, 20.0f)];
            _rightArrow = [[UIImageView alloc] initWithImage:image];
            [_subMenuView addSubview:_rightArrow];
            CGPoint point = CGPointMake(_subMenuView.frame.size.width+5.0f, _subMenuView.frame.size.height*0.5f);
            _rightArrow.center = point;
        }
        {
            UIImage* image = [SVFGenerateImageUtil imageForLeftArrow:[UIColor orangeColor] rect:CGRectMake(0.0f, 0.0f, 10.0f, 20.0f)];
            _leftArrow = [[UIImageView alloc] initWithImage:image];
            [_subMenuView addSubview:_leftArrow];
            CGPoint point = CGPointMake(-5.0f, _subMenuView.frame.size.height*0.5f);
            _leftArrow.center = point;
        }
    } else {
        {
            UIImage* image = [SVFGenerateImageUtil imageForDOWNArrow:[UIColor orangeColor] rect:CGRectMake(0.0f, 0.0f, 20.0f, 10.0f)];
            _downArrow = [[UIImageView alloc] initWithImage:image];
            [_subMenuView addSubview:_downArrow];
            CGPoint point = CGPointMake(_subMenuView.frame.size.width*0.5, _subMenuView.frame.size.height+5.0f);
            _downArrow.center = point;
        }
        {
            UIImage* image = [SVFGenerateImageUtil imageForUPArrow:[UIColor orangeColor] rect:CGRectMake(0.0f, 0.0f, 20.0f, 10.0f)];
            _upArrow = [[UIImageView alloc] initWithImage:image];
            [_subMenuView addSubview:_upArrow];
            CGPoint point = CGPointMake(_subMenuView.frame.size.width*0.5, -5.0f);
            _upArrow.center = point;
        }
    }
}

-(void)showSubMenuItem:(NSArray*)items point:(CGPoint)point
{
    _items = items;
    
    if ([items count]>=3) {
        CGRect rect = _subMenuView.frame;
        rect.size.height = _tableView.rowHeight*3+(_isVertical?0:5);
        _subMenuView.frame=rect;
    } else {
        CGRect rect = _subMenuView.frame;
        rect.size.height = _tableView.rowHeight*[items count]+(_isVertical?0:5);
        _subMenuView.frame=rect;
    }
    
    CGPoint sp = point;
    _subMenuView.center=sp;
    
    CGRect menuRect     = self.frame;
    CGRect submenuRect  = _subMenuView.frame;
    if (_isVertical) {
        // 横位置補正(デフォルト左)
        if (self.superview.bounds.size.width - CGRectGetMaxX(menuRect) < _subMenuView.frame.size.width + 15) {
            // 右側に表示
            submenuRect.origin.x = menuRect.origin.x - _subMenuView.frame.size.width - 15;
            CGRect rect = _tableView.frame;
            rect.origin.x = 0;
            _tableView.frame  = rect;
            
            CGPoint point = CGPointMake(_subMenuView.frame.size.width+5.0f, _subMenuView.frame.size.height*0.5f);
            _rightArrow.center = point;
            
            _rightArrow.hidden= NO;
            _leftArrow.hidden = YES;
        } else {
            // 左側に表示
            submenuRect.origin.x = CGRectGetMaxX(menuRect) + 15;
            CGRect rect = _tableView.frame;
            rect.origin.x = 5;
            _tableView.frame = rect;
            
            // 高さが変わるので
            CGPoint point = CGPointMake(-5.0f, _subMenuView.frame.size.height*0.5f);
            _leftArrow.center = point;
            
            _rightArrow.hidden= YES;
            _leftArrow.hidden = NO;
        }
    } else {
        // 縦位置補正(デフォルト上)
        if (menuRect.origin.y < _subMenuView.frame.size.height + 15) {
            // 下側に表示
            submenuRect.origin.y = CGRectGetMaxY(menuRect) + 15;
            CGRect rect = _tableView.frame;
            rect.origin.y = 5;
            
            _tableView.frame  = rect;
            _downArrow.hidden = YES;
            _upArrow.hidden   = NO;
        } else {
            // 上側に表示
            submenuRect.origin.y = menuRect.origin.y - _subMenuView.frame.size.height - 15;
            CGRect rect = _tableView.frame;
            rect.origin.y = 0;
            _tableView.frame = rect;
            
            // 高さが変わるので
            CGPoint point = CGPointMake(_subMenuView.frame.size.width*0.5, _subMenuView.frame.size.height+5.0f);
            _downArrow.center = point;
            
            _downArrow.hidden = NO;
            _upArrow.hidden   = YES;
        }
    }
    _subMenuView.frame = submenuRect;
    [_tableView reloadData];
    
    _subMenuView.hidden=NO;
    
    UIView* superView = self.superview;
    [superView addSubview:_subMenuView];
}

#pragma mark -
#pragma mark Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (_selectedItem) {
        return [[_subMenuItems objectForKey:_selectedItem] count];
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.textColor                = [UIColor whiteColor];
    cell.textLabel.highlightedTextColor     = [UIColor whiteColor];
    cell.textLabel.font                     = [UIFont boldSystemFontOfSize:12];
    [cell setBackgroundColor:[UIColor darkTextColor]];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell-%@",_selectedItem];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary* dict = [[_subMenuItems objectForKey:_selectedItem] objectAtIndex:indexPath.row];
    NSString*   title = [dict objectForKey:@"title"];
    UIImage*    icon  = [dict objectForKey:@"icon"];
    
    NSLog(@"icon[%@]",icon);
    
    cell.textLabel.text = title;
    cell.textLabel.highlightedTextColor = [UIColor orangeColor];
    if (icon) {
        cell.imageView.image = icon;
    }
    
    UIView *selected_bg_view = [[UIView alloc] initWithFrame:cell.bounds];
    selected_bg_view.backgroundColor = [UIColor orangeColor];
    cell.selectedBackgroundView = selected_bg_view;
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary* dict = [[_subMenuItems objectForKey:_selectedItem] objectAtIndex:indexPath.row];
    
    NSString*   key = [dict objectForKey:@"key"];

    [_delegate contextMenuView:self didSelectedItemAtIndex:indexPath.row forKey:key];
}

@end
