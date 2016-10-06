//
//  BusinessViewController.m
//  FreshToday
//
//  Created by naomi schettini on 2016-10-06.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "BusinessViewController.h"
#import <UIKit/UIKit.h>

@interface BusinessViewController ()

- (IBAction)didPressUpload:(UIButton *)sender;

@end

@implementation BusinessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (IBAction)didPressAdd:(UIButton *)sender {
}

//- (IBAction)didPressUpload:(UIButton *)sender {
//    
//    UIImagePickerController *pickerLibrary = [[UIImagePickerController alloc] init];
//    pickerLibrary.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    pickerLibrary.delegate = self;
//    [self presentViewController:pickerLibrary animated:YES completion:nil];
//    
//    
//}
//
//- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
//{
//    UIImage *myImage = image;
//}


@end
