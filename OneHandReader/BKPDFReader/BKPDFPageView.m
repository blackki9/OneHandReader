//
//  BKPDFReaderView.m
//  OneHandReader
//
//  Created by black9 on 07/06/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "BKPDFPageView.h"
#import "BKPDFDocument.h"
#import <PureLayout.h>

@interface BKPDFPageView ()

@property (nonatomic, strong) BKPDFDocument* pdfDocument;
@property (nonatomic,assign) NSInteger currentPage;

@end

@implementation BKPDFPageView{
    CGFloat currentScale;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]) {
        [self p_moveToFirstPage];
        self.contentMode = UIViewContentModeRedraw;
    }
    
    return self;
}
- (void)p_moveToFirstPage {
    [self moveToPage:1];
}

#pragma mark - page movement
- (void)moveToNextPage
{
    [self moveToPage:self.currentPage + 1];
}
- (void)moveToPreviousPage
{
    [self moveToPage:self.currentPage - 1];
}
- (void)moveToPage:(NSInteger)page
{
    if([self p_isPageInBoundsOfDocument:page]) {
        self.currentPage = page;
        [self setNeedsDisplay];
    }
}
- (BOOL)p_isPageInBoundsOfDocument:(NSInteger)page
{
    if(page < 1 || page > self.pdfDocument.pagesAmount) {
        return NO;
    }
    
    return YES;
}

#pragma mark - public methods
- (void)showPdfDocument:(BKPDFDocument*)document
{
    self.pdfDocument = document;
    
    CGRect frame = self.frame;
    CGSize pdfDocumentSize = [self.pdfDocument rectForPage].size;
    CGFloat aspectRatio = frame.size.width / pdfDocumentSize.width;
    
    [self scaleDocumentWithScale:aspectRatio];
}

- (void)scaleDocumentWithScale:(CGFloat)scale
{
    currentScale = scale;

    CGSize pdfDocumentSize = [self.pdfDocument rectForPage].size;
    CGSize newSize = CGSizeMake(pdfDocumentSize.width * scale, pdfDocumentSize.height * scale);
    
    self.frame = CGRectMake(0, 0, newSize.width, newSize.height);
    
    [self removeConstraints:self.constraints];
    [self autoSetDimensionsToSize:newSize];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [[UIColor whiteColor] set];
    CGContextFillRect(ctx, rect);
    
    [self p_flipContext:ctx rect:rect];
    CGPDFPageRef page1 = [self.pdfDocument pageWithNumber:self.currentPage];
    CGContextScaleCTM(ctx, currentScale, currentScale);
    
    CGContextDrawPDFPage(ctx, page1);
}
- (void)p_flipContext:(CGContextRef)context rect:(CGRect)rect
{
    CGContextGetCTM(context);
    CGContextScaleCTM(context, 1, -1);
    CGContextTranslateCTM(context, 0, -rect.size.height);
}

@end
