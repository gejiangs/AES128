//
//  ViewController.m
//  AES128
//
//  Created by yisanmao on 15/9/18.
//  Copyright (c) 2015年 zmw. All rights reserved.
//

#import "ViewController.h"
#import "AESOC.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *keyTF;
@property (weak, nonatomic) IBOutlet UITextView *valueTV;
@property (weak, nonatomic) IBOutlet UITextView *resultTV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"AES加/解密";
    
    self.keyTF.text = @"123456";
    self.valueTV.text = @"123";
    
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                             style:UIBarButtonItemStyleDone
                                                            target:self
                                                            action:@selector(done)];
    self.navigationItem.rightBarButtonItem = done;
}

-(void)done
{
    [self.keyTF resignFirstResponder];
    [self.valueTV resignFirstResponder];
    [self.resultTV resignFirstResponder];
}

- (IBAction)encrypt:(id)sender
{
    if (![self valid]) {
        return;
    }
    NSString *key_s = self.keyTF.text;
    NSString *value = self.valueTV.text;
    self.resultTV.text = [AESOC encrypt:key_s value:value];
}

- (IBAction)decrypt:(id)sender
{
    if (![self valid]) {
        return;
    }
    
    NSString *key_s = self.keyTF.text;
    NSString *value = self.valueTV.text;
    self.resultTV.text = [AESOC decrypt:key_s value:value];
}

-(BOOL)valid
{
    BOOL isOK = YES;
    
    if ([self.keyTF.text length] == 0) {
        isOK = NO;
    }
    
    if ([self.valueTV.text length] == 0) {
        isOK = NO;
    }
    
    return isOK;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
