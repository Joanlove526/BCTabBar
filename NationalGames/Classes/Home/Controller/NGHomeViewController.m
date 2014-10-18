//
//  NGHomeViewController.m
//  NationalGames
//
//  Created by Apple on 14/10/16.
//  Copyright (c) 2014年 MeiRiQ. All rights reserved.
//

#import "NGHomeViewController.h"

@interface NGHomeViewController ()

@end

@implementation NGHomeViewController

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

    self.view.backgroundColor = [UIColor clearColor];
    
    self.navigationItem.title = @"全民小游戏";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
