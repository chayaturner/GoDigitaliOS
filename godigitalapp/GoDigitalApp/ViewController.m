//
//  ViewController.m
//  GoDigitalApp
//
//  Created by Chaya Turner on 8/11/16.
//  Copyright © 2016 Chaya Turner. All rights reserved.
//


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
    
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//remove navigation bar from the home view
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

//allow navigation bar to reappear when home view changes
- (void)viewDidDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewDidDisappear:animated];
}


@end
