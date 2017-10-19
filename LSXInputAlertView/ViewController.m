//
//  ViewController.m
//  LSXInputAlertView
//
//  Created by 医联通 on 17/9/9.
//  Copyright © 2017年 LSX. All rights reserved.
//

#import "ViewController.h"
#import "LSXAlertInputView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    LSXAlertInputView * alert=[[LSXAlertInputView alloc]initWithTitle:@"提示" PlaceholderText:@"请输入文字" WithKeybordType:LSXKeyboardTypeDefault CompleteBlock:^(NSString *contents) {
        NSLog(@"-----%@",contents);
    }];
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
