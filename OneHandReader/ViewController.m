//
//  ViewController.m
//  OneHandReader
//
//  Created by black9 on 06/06/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "ViewController.h"
#import "BKPDFScrollReader.h"
#import "BKPDFDocument.h"
#import <PureLayout.h>

@interface ViewController ()

@property (nonatomic, strong) BKPDFScrollReader* readerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.readerView = [[BKPDFScrollReader alloc] initWithFrame:self.view.bounds];
    
    BKPDFDocument* document = [[BKPDFDocument alloc] initWithFileURL:[[NSBundle mainBundle] URLForResource:@"test" withExtension:@"pdf"]];

    [self.view addSubview:_readerView];
        
    [_readerView showPdfDocument:document];
    
    [_readerView moveToPage:15];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
