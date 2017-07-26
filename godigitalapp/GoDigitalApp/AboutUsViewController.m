//
//  AboutUsViewController.m
//  GoDigitalApp
//
//  Created by Chaya Turner on 8/11/16.
//  Copyright © 2016 Chaya Turner. All rights reserved.
//

#import "AboutUsViewController.h"
#import "Reachability.h"

@interface AboutUsViewController (){
    Reachability *internetReachable;
}

@end

@implementation AboutUsViewController

//check for internet connection
- (void)testInternetConnection {
    internetReachable = [Reachability reachabilityWithHostName:@"www.google.com"];
    
    //internet is reachable
    internetReachable.reachableBlock = ^(Reachability*reach){
        //update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"INTERNET REACHABLE");
        });
    };
    
    //internet is not reachable
    __unsafe_unretained typeof(self) weakSelf = self;
    internetReachable.unreachableBlock = ^(Reachability*reach){
        //update the UI in the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertController *alert = [UIAlertController
                                        alertControllerWithTitle:@"Uh oh!"
                                        message:@"No internet connection"
                                        preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *ok = [UIAlertAction
                                 actionWithTitle:@"OK"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action) {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                 }];
            
            [alert addAction:ok];
            
            [weakSelf presentViewController:alert animated:YES completion:nil];
        });
    };
    
    [internetReachable startNotifier];
}

- (void)viewDidLoad {
    [aboutUsWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.ibrooklyn.com/resources/online-marketing-assistance"]]];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testInternetConnection];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
