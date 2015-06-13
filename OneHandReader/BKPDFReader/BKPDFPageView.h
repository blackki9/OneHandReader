//
//  BKPDFReaderView.h
//  OneHandReader
//
//  Created by black9 on 07/06/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BKPDFDocument;

@interface BKPDFPageView : UIView

- (void)showPdfDocument:(BKPDFDocument*)document;
- (void)scaleDocumentWithScale:(CGFloat)scale;

- (void)moveToPage:(NSInteger)page;
- (void)moveToNextPage;
- (void)moveToPreviousPage;

@end
