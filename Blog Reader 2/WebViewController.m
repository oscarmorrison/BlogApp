//
//  WebViewController.m
//  Blog Reader 2
//
//  Created by Oscar Morrison on 18/09/13.
//  Copyright (c) 2013 ocodaa. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()


@end

@implementation WebViewController

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
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL: self.blogPostURL];
    [self.webView loadRequest: urlRequest];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(increaseProgress) userInfo:nil repeats:YES];
    
    
}

- (void) webViewDidStartLoad:(UIWebView *)webView{
    
    NSLog(@"start load");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.progressBar.hidden = TRUE;
    NSLog(@"finished load");
}

-(void) increaseProgress{
    
    time = time + 0.05;
    self.progressBar.progress = time;
    if (time > 1.2) {
        self.progressBar.hidden = TRUE;

    }
    
    
}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
