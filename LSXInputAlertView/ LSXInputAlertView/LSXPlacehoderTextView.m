//
//  LSXPlacehoderTextView.m
//  LSXInputAlertView
//
//  Created by 医联通 on 17/9/9.
//  Copyright © 2017年 LSX. All rights reserved.
//

#import "LSXPlacehoderTextView.h"

static NSString * const kTextKey = @"text";


@interface LSXPlacehoderTextView ()

@property (nonatomic, strong) UITextView *placeholderView;

@end


@implementation LSXPlacehoderTextView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUpPlaceholderView];
    }
    
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUpPlaceholderView];
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self removeObserver:self forKeyPath:kTextKey];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _placeholderView.frame = self.bounds;
}


#pragma mark - observation

- (void)setUpPlaceholderView
{
    _placeholderView = [UITextView new];
    _placeholderView.editable = NO;
    _placeholderView.scrollEnabled = NO;
    _placeholderView.showsHorizontalScrollIndicator = NO;
    _placeholderView.showsVerticalScrollIndicator = NO;
    _placeholderView.userInteractionEnabled = NO;
    _placeholderView.font = self.font;
    _placeholderView.contentInset = self.contentInset;
    _placeholderView.contentOffset = self.contentOffset;
    _placeholderView.textContainerInset = self.textContainerInset;
    _placeholderView.textColor = [UIColor redColor];
    _placeholderView.backgroundColor = [UIColor clearColor];
    [self addSubview:_placeholderView];
    
    
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter addObserver:self selector:@selector(textDidChange:)
                          name:UITextViewTextDidChangeNotification object:self];
    
    [self addObserver:self forKeyPath:kTextKey options:NSKeyValueObservingOptionNew context:nil];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:kTextKey]) {
        _placeholderView.hidden = [self hasText];
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}


- (void)textDidChange:(NSNotification *)notification
{
    _placeholderView.hidden = [self hasText];
}



#pragma mark - setter

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    _placeholderView.font = font;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
    [super setTextAlignment:textAlignment];
    _placeholderView.textAlignment = textAlignment;
}

- (void)setContentInset:(UIEdgeInsets)contentInset
{
    [super setContentInset:contentInset];
    _placeholderView.contentInset = contentInset;
}

- (void)setContentOffset:(CGPoint)contentOffset
{
    [super setContentOffset:contentOffset];
    _placeholderView.contentOffset = contentOffset;
}

- (void)setTextContainerInset:(UIEdgeInsets)textContainerInset
{
    [super setTextContainerInset:textContainerInset];
    _placeholderView.textContainerInset = textContainerInset;
}

#pragma mark placeholder

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholderView.text = placeholder;
}

- (NSString *)placeholder
{
    return _placeholderView.text;
}



@end
