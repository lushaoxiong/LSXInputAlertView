//
//  LSXAlertInputView.h
//  wxf
//
//  Created by 医联通 on 17/9/6.
//  Copyright © 2017年 lsx. All rights reserved.
//

#import <UIKit/UIKit.h>
// 屏幕高度
#define SCREEN_HEIGHT         [[UIScreen mainScreen] bounds].size.height
// 屏幕宽度
#define SCREEN_WIDTH          [[UIScreen mainScreen] bounds].size.width
#define RGBA(r,g,b,a)         [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
typedef NS_ENUM(NSInteger, LSXKeyboardType) {
    
    LSXKeyboardTypeDefault  = 0,                // Default type for the current input metho
    LSXKeyboardTypeURL  = 1,                    // A type optimized for URL entry (shows . / .com prominently).
    LSXKeyboardTypeNumberPad = 2,              // A number pad with locale-appropriate digits (0-9, ۰-۹, ०-९, etc.). Suitable for PIN entry.
    LSXKeyboardTypePhonePad = 3,               // A phone pad (1-9, *, 0, #, with letters under the numbers).
    LSXKeyboardTypeNamePhonePad = 4,           // A type optimized for entering a person's name or phone number.
};


@interface LSXAlertInputView : UIView
/***
   参数：title         //标题
   参数：PlaceholderText//默认提示语句
 **/
-(instancetype)initWithTitle:(NSString *)title PlaceholderText:(NSString *)PlaceholderText WithKeybordType:(LSXKeyboardType)bordtype CompleteBlock:(void(^)(NSString * contents))completeBlock;
//字数限制默认不限
@property (nonatomic , assign) int  num;
/**
   显示
 **/
-(void)show;
@end
