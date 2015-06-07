//
//  BKPDFScrollReader.m
//  OneHandReader
//
//  Created by black9 on 07/06/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "BKPDFScrollReader.h"
#import <PureLayout.h>
@interface BKPDFScrollReader ()

@property (nonatomic, strong) UIScrollView* contentScroll;

@end

@implementation BKPDFScrollReader

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [self initWithFrame:frame]) {
        [self setupScrollWithFrame:frame];
    }
    return self;
}
- (void)setupScrollWithFrame:(CGRect)frame
{
    self.contentScroll = [[UIScrollView alloc] initWithFrame:frame];
    [self addSubview:self.contentScroll];
    [self pinScrollToSuperView];
}
- (void)pinScrollToSuperView
{
    [self.contentScroll autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
}

@end
