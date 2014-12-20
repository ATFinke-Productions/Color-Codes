//
//  CreditsWebViewController.h
//  StockTable
//
//  Created by Andrew on 6/16/13.
//  Copyright (c) 2013 ATFinke Productions Incorperated. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreditsWebViewController : UIViewController <UIWebViewDelegate> {
    IBOutlet UIWebView * webView;
}

@property (strong, nonatomic) id webItem;

-(IBAction)dismiss:(id)sender;

@end
