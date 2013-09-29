//
//  WebViewController.h
//  Blog Reader 2
//
//  Created by Oscar Morrison on 18/09/13.
//  Copyright (c) 2013 ocodaa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>{
    float time;
    NSTimer *timer;
}

@property (strong, nonatomic) NSURL *blogPostURL;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;


- (void)webViewDidFinishLoad:(UIWebView *)webView;

-(void) increaseProgress;

@end
