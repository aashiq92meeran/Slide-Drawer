//
//  MainViewController.m
//  Slide Drawer
//
//  Created by BSA univ 8 on 30/05/14.
//  Copyright (c) 2014 Hispark. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize menuDrawerWidth,menuDrawerX,recognizer_close,recognizer_open;

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
    
    int statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    menuDrawerWidth  = self.view.frame.size.width *0.75;
    menuDrawerX  = self.view.frame.origin.x - menuDrawerWidth;
    menuDrawer = [[UIView alloc]initWithFrame:CGRectMake(menuDrawerX, self.view.frame.origin.y+statusBarHeight,menuDrawerWidth, self.view.frame.size.height-statusBarHeight)];
    menuDrawer.backgroundColor = [UIColor redColor];
    recognizer_close= [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes)];
    
    recognizer_open = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes)];
    
    recognizer_close.direction= UISwipeGestureRecognizerDirectionLeft;
    
    recognizer_open.direction= UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:recognizer_open];
    [self.view addGestureRecognizer:recognizer_close];
    
    [self.view addSubview:menuDrawer];
    
    
  }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)menuButton:(id)sender

{
     [self drawerAnimation];
    
}
-(void)handleSwipes:(UISwipeGestureRecognizer *) sender

{
    [self drawerAnimation];
    
    
}
-(void)drawerAnimation
{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:-5];
    
    CGFloat new_x = 0;
    
    if(menuDrawer.frame.origin.x < self.view.frame.origin.x){
        new_x = menuDrawer.frame.origin.x + menuDrawerWidth;
    }else{
        new_x=menuDrawer.frame.origin.x -menuDrawerWidth;
        
    }
    menuDrawer.frame = CGRectMake(new_x, menuDrawer.frame.origin.y, menuDrawer.frame.size.width, menuDrawer.frame.size.height);
    [UIView commitAnimations];
    }
    

@end
