//
//  ViewController.m
//  ImageFIlter
//
//  Created by Haian Liu on 1/2/15.
//  Copyright (c) 2015 Haian Liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *targetIMG;
@property (weak, nonatomic) IBOutlet UIImageView *resultImg;

@end

@implementation ViewController
- (IBAction)addFilter:(id)sender {
    CIContext *context = [CIContext contextWithOptions:nil];               // 1
    //CIImage *image = [CIImage imageWithContentsOfURL:myURL];               // 2
    CIImage *image = [[CIImage alloc] initWithImage:[UIImage imageNamed:@"Boston City Flow.jpg"]];
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone"];           // 3
    [filter setValue:image forKey:kCIInputImageKey];
    [filter setValue:@0.8f forKey:kCIInputIntensityKey];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];              // 4
    CGRect extent = [result extent];
    CGImageRef cgImage = [context createCGImage:result fromRect:extent];   // 5
    //UIImage *newIMG=[[UIImage alloc] initWithCIImage:result];
    UIImage *newIMG=[UIImage imageWithCGImage:[context createCGImage:result fromRect:result.extent]];
    [self.resultImg setImage:newIMG];
    //[self.targetIMG setImage:newIMG];
    //self.resultImg.image=cgImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
