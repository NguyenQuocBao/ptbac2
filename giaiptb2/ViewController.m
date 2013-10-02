//
//  ViewController.m
//  giaiptb2
//
//  Created by Nguyen Bao on 10/1/13.
//  Copyright (c) 2013 nguyenquocbao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *a;
@property (weak, nonatomic) IBOutlet UITextField *b;
@property (weak, nonatomic) IBOutlet UITextField *c;
@property (weak, nonatomic) IBOutlet UILabel *result;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.result.text=Nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)giaipt:(id)sender {
    self.result.text=@"";
    if ([self.a.text isEqualToString:@""]){
        self.result.text=@"Chưa nhập A";
        [self.view endEditing:YES];
        return;
    }else{
        if (![self isNumeric:(self.a.text)]){
        self.result.text=@"A phải là số";
            [self.view endEditing:YES];
            return;
        }
    }
    
    
    
    if ([self.b.text isEqualToString:@""]){
        self.result.text=@"Chưa nhập B";
        [self.view endEditing:YES];
        return;
    }else{
        if (![self isNumeric:(self.b.text)]){
            self.result.text=@"B phải là số";
            [self.view endEditing:YES];
            return;
        }
    }

    
    
    if ([self.c.text isEqualToString:@""]){
        self.result.text=@"Chưa nhập C";
        [self.view endEditing:YES];
        return;
    }else{
        if (![self isNumeric:(self.c.text)]){
            self.result.text=@"C phải là số";
            [self.view endEditing:YES];
            return;
        }
    }

    
    float av = [self.a.text floatValue];
    float bv = [self.b.text floatValue];
    float cv = [self.c.text floatValue];
    
    if (av==0){
    
        if (bv!=0){
            
            self.result.text=[[NSString alloc] initWithFormat:@"Phương trình có 1 nghiệm duy nhat = %0.2f",-cv/bv];
        
        }else{
            if (cv!=0){
                self.result.text=@"Phương trình không xác định";
            
            }else{
                self.result.text=@"Phương trình vô nghiệm";
            
            }
            
            
        }
    }else{
        
    
    
        @try{
            float delta = bv * bv - 4 * av * cv;
            if(delta <0) {
                @throw [[NSException alloc] initWithName:@"Delta <0 " reason:@"Phương trình vô nghiệm!" userInfo:nil];
            }
            else if(delta == 0) {
                self.result.text = [[NSString alloc] initWithFormat:@"Phương trình có 1 nghiệm duy nhất\nx1 = x2 = %0.2f",bv / av * -0.5];
            }
            else {
                float x1 = (bv * -1 + pow(delta, 0.5)) / 2 * av;
                float x2 = (bv * -1 - pow(delta, 0.5)) / 2 * av;
                self.result.text = [[NSString alloc] initWithFormat:@"Phương trình có 2 nghiệm phân biệt\nx1 =%0.2f; x2 = %0.2f",x1,x2];
            }
            
           // [self calculator: numberA : numberB : numberC];
        }@catch (NSException *ex) {
            self.result.text = [[NSString alloc] initWithFormat:@"%@\n%@",ex.name,ex.reason];
        }
        
        
    }
    
    
    
    
    
    [self.view endEditing:YES];
}



-(bool) isNumeric:(NSString*) hexText
{
    //NSNumberFormatter* numberFormatter = [[[NSNumberFormatter alloc] init]];
    
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
    
    NSNumber* number = [numberFormatter numberFromString:hexText];
    
    if (number != nil) {
       // NSLog(@"%@ is numeric", hexText);
        //do some stuff here
        return true;
    }
    
    //NSLog(@"%@ is not numeric", hexText);
    //or do some more stuff here
    return false;
}




@end
