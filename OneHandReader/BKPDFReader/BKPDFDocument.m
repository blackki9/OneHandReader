//
//  BKPDFDocument.m
//  OneHandReader
//
//  Created by black9 on 07/06/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "BKPDFDocument.h"

@interface BKPDFDocument ()

@property (nonatomic, assign) CGPDFDocumentRef pdfRef;

@end

@implementation BKPDFDocument

- (instancetype)initWithFileURL:(NSURL*)fileURL
{
    if(self = [super init]) {
        _pdfRef = [self pdfRefForURL:fileURL];
    }
    
    return self;
}
- (CGPDFDocumentRef)pdfRefForURL:(NSURL*)fileUrl
{
    CGPDFDocumentRef document = CGPDFDocumentCreateWithURL((CFURLRef)fileUrl);
    
    self.pagesAmount = CGPDFDocumentGetNumberOfPages(document);
    
    return document;
}

- (CGPDFPageRef)pageWithNumber:(NSInteger)pageNumber
{
    CGPDFPageRef result = CGPDFDocumentGetPage(self.pdfRef, pageNumber);
    return result;
}

- (CGRect)rectForPage
{
    return CGPDFPageGetBoxRect([self pageWithNumber:1], kCGPDFMediaBox);
}

- (void)dealloc
{
    CGPDFDocumentRelease(_pdfRef);
}

@end
