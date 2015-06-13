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
}
- (void)pinScrollToSuperView
{
    [self.contentScroll removeConstraints:self.contentScroll.constraints];
    [self.contentScroll autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
}
- (void)setupReaderWithFrame:(CGRect)frame
{
    self.readerView = [[BKPDFPageView alloc] initWithFrame:self.bounds];
    [self.contentScroll addSubview:self.readerView];
}
- (void)pinReaderToScrollView
{
    [self.readerView removeConstraints:self.readerView.constraints];
    [self.readerView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
}

- (void)showPdfDocument:(BKPDFDocument*)document
{
    [self pinToSuperView];
    [self pinScrollToSuperView];
    [self pinReaderToScrollView];
    [self.readerView showPdfDocument:document];
}
- (void)pinToSuperView
{
    [self removeConstraints:self.constraints];
    [self autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0,0)];
}

- (void)scaleDocumentWithScale:(CGFloat)scale
{
    [self.readerView scaleDocumentWithScale:scale];
}

#pragma mark - page movement

- (void)moveToPage:(NSInteger)page
{
    [self scrollPageToTop];
    [self.readerView moveToPage:page];
}
- (void)moveToNextPage
{
    [self scrollPageToTop];
    [self.readerView moveToNextPage];
}
- (void)moveToPreviousPage
{
    [self scrollPageToTop];
    [self.readerView moveToPreviousPage];
}
- (void)scrollPageToTop
{
    [self.contentScroll scrollsToTop];
}

@end
