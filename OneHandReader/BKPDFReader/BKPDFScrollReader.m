//
//  BKPDFScrollReader.m
//  OneHandReader
//
//  Created by black9 on 07/06/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "BKPDFScrollReader.h"
#import <PureLayout.h>
#import "BKPDFPageView.h"

@interface BKPDFScrollReader ()

@property (nonatomic, strong) UIScrollView* contentScroll;
@property (nonatomic, strong) BKPDFPageView* readerView;

@end

@implementation BKPDFScrollReader

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]) {
        [self setupScrollWithFrame:frame];
        [self setupReaderWithFrame:frame];
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
- (void)setupReaderWithFrame:(CGRect)frame
{
    self.readerView = [[BKPDFPageView alloc] initWithFrame:self.bounds];
    [self.contentScroll addSubview:self.readerView];
}
- (void)pinReaderToScrollView
{
    [self.readerView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
}

- (void)showPdfDocument:(BKPDFDocument*)document
{
    [self.readerView showPdfDocument:document];
    [self pinReaderToScrollView];
}

@end
