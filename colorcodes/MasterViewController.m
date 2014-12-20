//
//  MasterViewController.m
//  colorcodes
//
//  Created by Andrew on 6/18/13.
//  Copyright (c) 2013 ATFinke Productions Incorperated. All rights reserved.
//

#import "MasterViewController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)share:(id)sender {
    NSString *shareString = @"Checkout this cool free app Color Codes! Now updated for iOS 7!\nhttp://bit.ly/P0IyI8";
    UIImage *iconImage = [UIImage imageNamed:@"IconImage"];
    NSArray *items = @[shareString,iconImage];
    
    UIActivityViewController *share = [[UIActivityViewController alloc]initWithActivityItems:items applicationActivities:nil];
    if ([[UIDevice currentDevice] systemVersion].doubleValue >= 8.0) {
        share.popoverPresentationController.sourceView = sender;
    }
    [self presentViewController:share animated:YES completion:nil];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section > 2) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        UIActivityViewController *vc = [[UIActivityViewController alloc] initWithActivityItems:@[cell.textLabel.text] applicationActivities:nil];
        if ([[UIDevice currentDevice] systemVersion].doubleValue >= 8.0) {
            vc.popoverPresentationController.sourceView = cell;
        }
        [self presentViewController:vc animated:true completion:nil];
    }

}

@end
