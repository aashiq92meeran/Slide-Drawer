//
//  MainViewController.h
//  Slide Drawer
//
//  Created by BSA univ 8 on 30/05/14.
//  Copyright (c) 2014 Hispark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
{
   UIView *menuDrawer;
    
}

@property (readonly,nonatomic) UISwipeGestureRecognizer  *recognizer_open,*recognizer_close;

@property(readonly,nonatomic) int menuDrawerX,menuDrawerWidth;


-(void)handleSwipes:(UISwipeGestureRecognizer *) sender;
-(void)drawerAnimation;


-(IBAction)menuButton:(id)sender;

@end
