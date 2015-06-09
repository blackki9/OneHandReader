//
//  BKPDFReaderView.m
//  OneHandReader
//
//  Created by black9 on 07/06/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "BKPDFPageView.h"
#import "BKPDFDocument.h"
@interface BKPDFPageView ()

@property (nonatomic, strong) BKPDFDocument* pdfDocument;
@property (nonatomic,assign) NSInteger currentPage;
@end

@implementation BKPDFPageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]) {
        _currentPage = 1;
        [self setupGestureRecognizers];
    }
    
    return self;
}
- (void)setupGestureRecognizers
{
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    tapRecognizer.numberOfTapsRequired = 2;
    
    [self addGestureRecognizer:tapRecognizer];
}
- (void)doubleTap:(UITapGestureRecognizer*)recognizer
{
    self.currentPage++;
    [self setNeedsDisplay];
}

- (void)showPdfDocument:(BKPDFDocument*)document
{
    self.pdfDocument = document;
    
    CGRect frame = self.frame;
    frame.size = [self.pdfDocument rectForPage].size;
    //self.frame = frame;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // PDF might be transparent, assume white paper
    [[UIColor blueColor] set];
    CGContextFillRect(ctx, rect);
    
    [self flipContext:ctx rect:rect];
    // url is a file URL
    CGPDFPageRef page1 = [self.pdfDocument pageWithNumber:self.currentPage];

    CGContextDrawPDFPage(ctx, page1);
}
- (void)flipContext:(CGContextRef)context rect:(CGRect)rect
{
    CGContextGetCTM(context);
    CGContextScaleCTM(context, 1, -1);
    CGContextTranslateCTM(context, 0, -rect.size.height);
}

@end
