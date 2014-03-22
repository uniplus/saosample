//
//  SVFViewController.m
//  saosample
//
//  Created by 秋山 高弘 on 2014/02/12.
//  Copyright (c) 2014年 Silver Frontier. All rights reserved.
//

#import "SVFViewController.h"
#import "SAOContextMenuView.h"
#import "SVFGenerateImageUtil.h"

@interface SVFViewController ()

@end

@implementation SVFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

    [self createContextMenu];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Rotate Event
-(BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    //表示しているViewControllerにまかせる
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

//1
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)orientation
                                duration:(NSTimeInterval)duration
{
    [self hideContextMenu];
}

- (void)createContextMenu
{
    // 横
    {
        _horizontalContextMenu = [[SAOContextMenuView alloc] initWithFrame:CGRectMake(40, 40, (45+10)*5, 45)];
        _horizontalContextMenu.delegate=(id)self;
        [self.view addSubview:_horizontalContextMenu];
        
        [_horizontalContextMenu addItemWithIcon:[UIImage imageNamed:@"settings.png"] forKey:@"menu1"];
        [_horizontalContextMenu addItemWithTitle:@"項目２"   forKey:@"menu2"];
        [_horizontalContextMenu addItemWithTitle:@"項目３"   forKey:@"menu3"];
        [_horizontalContextMenu addItemWithTitle:@"項目４"   forKey:@"menu4"];
        [_horizontalContextMenu addItemWithTitle:@"項目５"   forKey:@"menu5"];
        
        UIImage* image1 = [SVFGenerateImageUtil imageForCircle:[SVFViewController colorWithHex:@"#FFEF00" alpha:1.0f] rect:CGRectMake(0, 0, 20, 20)];
        UIImage* image2 = [SVFGenerateImageUtil imageForCircle:[SVFViewController colorWithHex:@"#B4F617" alpha:1.0f] rect:CGRectMake(0, 0, 20, 20)];
        UIImage* image3 = [SVFGenerateImageUtil imageForCircle:[SVFViewController colorWithHex:@"#86BEFF" alpha:1.0f] rect:CGRectMake(0, 0, 20, 20)];
        UIImage* image4 = [SVFGenerateImageUtil imageForCircle:[SVFViewController colorWithHex:@"#F87EDB" alpha:1.0f] rect:CGRectMake(0, 0, 20, 20)];
        
        [_horizontalContextMenu addSubMenuItemWithTitle:@"イエロー" icon:image1 forKey:@"menu1"];
        [_horizontalContextMenu addSubMenuItemWithTitle:@"グリーン" icon:image2 forKey:@"menu1"];
        [_horizontalContextMenu addSubMenuItemWithTitle:@"ブルー" icon:image3 forKey:@"menu1"];
        [_horizontalContextMenu addSubMenuItemWithTitle:@"ピンク" icon:image4 forKey:@"menu1"];
        
        [_horizontalContextMenu addSubMenuItemWithTitle:@"submenu1" icon:nil forKey:@"menu2"];
        [_horizontalContextMenu addSubMenuItemWithTitle:@"submenu2" icon:nil forKey:@"menu2"];
        [_horizontalContextMenu addSubMenuItemWithTitle:@"submenu3" icon:nil forKey:@"menu2"];
        [_horizontalContextMenu addSubMenuItemWithTitle:@"submenu4" icon:nil forKey:@"menu2"];
        
        [_horizontalContextMenu addSubMenuItemWithTitle:@"submenu1" icon:nil forKey:@"menu3"];
        [_horizontalContextMenu addSubMenuItemWithTitle:@"submenu2" icon:nil forKey:@"menu3"];
        [_horizontalContextMenu addSubMenuItemWithTitle:@"submenu3" icon:nil forKey:@"menu3"];
        [_horizontalContextMenu addSubMenuItemWithTitle:@"submenu4" icon:nil forKey:@"menu3"];
        
        [_horizontalContextMenu addSubMenuItemWithTitle:@"submenu1" icon:nil forKey:@"menu4"];
        [_horizontalContextMenu addSubMenuItemWithTitle:@"submenu2" icon:nil forKey:@"menu4"];
        [_horizontalContextMenu addSubMenuItemWithTitle:@"submenu3" icon:nil forKey:@"menu4"];
        [_horizontalContextMenu addSubMenuItemWithTitle:@"submenu4" icon:nil forKey:@"menu4"];
        
        [_horizontalContextMenu createMenu];
    }
    
    // 縦
    {
        _verticalContextMenu = [[SAOContextMenuView alloc] initWithFrame:CGRectMake(40, 40, 45, (45+10)*5)];
        _verticalContextMenu.isVertical = YES;
        _verticalContextMenu.delegate   = (id)self;
        [self.view addSubview:_verticalContextMenu];
        
        [_verticalContextMenu addItemWithTitle:@"１"   forKey:@"menu1"];
        [_verticalContextMenu addItemWithTitle:@"２"   forKey:@"menu2"];
        [_verticalContextMenu addItemWithTitle:@"３"   forKey:@"menu3"];
        [_verticalContextMenu addItemWithTitle:@"４"   forKey:@"menu4"];
        
        UIImage* image1 = [SVFGenerateImageUtil imageForCircle:[SVFViewController colorWithHex:@"#FFEF00" alpha:1.0f] rect:CGRectMake(0, 0, 20, 20)];
        UIImage* image2 = [SVFGenerateImageUtil imageForCircle:[SVFViewController colorWithHex:@"#B4F617" alpha:1.0f] rect:CGRectMake(0, 0, 20, 20)];
        UIImage* image3 = [SVFGenerateImageUtil imageForCircle:[SVFViewController colorWithHex:@"#86BEFF" alpha:1.0f] rect:CGRectMake(0, 0, 20, 20)];
        UIImage* image4 = [SVFGenerateImageUtil imageForCircle:[SVFViewController colorWithHex:@"#F87EDB" alpha:1.0f] rect:CGRectMake(0, 0, 20, 20)];
        
        [_verticalContextMenu addSubMenuItemWithTitle:@"イエロー" icon:image1 forKey:@"menu1"];
        [_verticalContextMenu addSubMenuItemWithTitle:@"グリーン" icon:image2 forKey:@"menu1"];
        [_verticalContextMenu addSubMenuItemWithTitle:@"ブルー" icon:image3 forKey:@"menu1"];
        [_verticalContextMenu addSubMenuItemWithTitle:@"ピンク" icon:image4 forKey:@"menu1"];
        
        [_verticalContextMenu addSubMenuItemWithTitle:@"サブメニュ１" icon:nil forKey:@"menu2"];
        [_verticalContextMenu addSubMenuItemWithTitle:@"サブメニュ２" icon:nil forKey:@"menu2"];
        [_verticalContextMenu addSubMenuItemWithTitle:@"サブメニュ３" icon:nil forKey:@"menu2"];
        [_verticalContextMenu addSubMenuItemWithTitle:@"サブメニュ４" icon:nil forKey:@"menu2"];
        
        [_verticalContextMenu addSubMenuItemWithTitle:@"サブメニュ１" icon:nil forKey:@"menu3"];
        [_verticalContextMenu addSubMenuItemWithTitle:@"サブメニュ２" icon:nil forKey:@"menu3"];
        [_verticalContextMenu addSubMenuItemWithTitle:@"サブメニュ３" icon:nil forKey:@"menu3"];
        [_verticalContextMenu addSubMenuItemWithTitle:@"サブメニュ４" icon:nil forKey:@"menu3"];
        
        [_verticalContextMenu addSubMenuItemWithTitle:@"サブメニュ１" icon:nil forKey:@"menu4"];
        [_verticalContextMenu addSubMenuItemWithTitle:@"サブメニュ２" icon:nil forKey:@"menu4"];
        [_verticalContextMenu addSubMenuItemWithTitle:@"サブメニュ３" icon:nil forKey:@"menu4"];
        [_verticalContextMenu addSubMenuItemWithTitle:@"サブメニュ４" icon:nil forKey:@"menu4"];
        
        [_verticalContextMenu createMenu];
    }
}

-(IBAction)singleTapAction:(UIGestureRecognizer*)sender
{
    CGPoint point = [sender locationInView:self.view];
    if (_showContextMenu) {
        _showContextMenu=NO;
        if ([self isLandscape]) {
            [ _verticalContextMenu hideMenu];
        } else {
            [ _horizontalContextMenu hideMenu];
        }
    } else {
        _showContextMenu=YES;
        if ([self isLandscape]) {
            [ _verticalContextMenu showMenu:point];
        } else {
            [ _horizontalContextMenu showMenu:point];
        }
    }
}

-(void)hideContextMenu
{
    [_horizontalContextMenu hideMenu];
    [_verticalContextMenu hideMenu];
}

#pragma mark - SAOContextMenuViewDelegate
-(void)contextMenuView:(SAOContextMenuView*)view didSelectedItemAtIndex:(NSInteger)index forKey:(NSString*)key
{
    if ([key hasPrefix:@"menu1"]) {
    } else if ([key hasPrefix:@"menu2"]) {
    } else if ([key hasPrefix:@"menu3"]) {
    } else if ([key hasPrefix:@"menu4"]) {
    }
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:key message:[NSString stringWithFormat:@"tap index %d",index] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];
    [self performSelector:@selector(hideContextMenu) withObject:nil afterDelay:0.3];
}

#pragma mark -
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    NSLog(@"touch               [%@]",[touch view]);
    NSLog(@"gestureRecognizer   [%@]",gestureRecognizer);
    if([touch.view isKindOfClass:[UITableViewCell class]]) {
        return NO;
    }
    // UITableViewCellContentView => UITableViewCell
    if([touch.view.superview isKindOfClass:[UITableViewCell class]]) {
        return NO;
    }
    // UITableViewCellContentView => UITableViewCellScrollView => UITableViewCell
    if([touch.view.superview.superview isKindOfClass:[UITableViewCell class]]) {
        return NO;
    }
    return YES;
}

-(BOOL)isLandscape
{
    UIInterfaceOrientation orientation =(UIInterfaceOrientation)[UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        return YES;
    }
    
    return NO;
}

+ (UIColor *) colorWithHex:(NSString *)string alpha:(CGFloat)alpha
{
    UIColor *color = nil;
    if (string && [string length] == 7) {
        NSString *colorString = [NSString stringWithFormat:@"0x%@ 0x%@ 0x%@",
								 [string substringWithRange:NSMakeRange(1, 2)],
								 [string substringWithRange:NSMakeRange(3, 2)],
								 [string substringWithRange:NSMakeRange(5, 2)]];
		
        unsigned red, green, blue;
        NSScanner *scanner = [NSScanner scannerWithString:colorString];
        if ([scanner scanHexInt:&red] && [scanner scanHexInt:&green] && [scanner scanHexInt:&blue]) {
            color = [UIColor colorWithRed:(float)red / 0xff
                                    green:(float)green / 0xff
                                     blue:(float)blue / 0xff
                                    alpha:alpha];
        }
    }
    return color;
}

+(UIColor *) colorWithRed:(float)red green:(float)green blue:(float)blue alpha:(float)alpha
{
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}



@end
