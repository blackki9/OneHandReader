//
//  BKPDFDocument.h
//  OneHandReader
//
//  Created by black9 on 07/06/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface BKPDFDocument : NSObject

@property (nonatomic, assign) NSInteger pagesAmount;

- (instancetype)initWithFileURL:(NSURL*)fileURL;
- (CGPDFPageRef)pageWithNumber:(NSInteger)pageNumber;
- (CGRect)rectForPage;

@end
