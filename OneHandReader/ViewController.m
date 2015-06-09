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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BKPDFScrollReader* readerView = [[BKPDFScrollReader alloc] initWithFrame:self.view.bounds];
    
    BKPDFDocument* document = [[BKPDFDocument alloc] initWithFileURL:[[NSBundle mainBundle] URLForResource:@"help" withExtension:@"pdf"]];

    [self.view addSubview:readerView];
    
    [readerView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0,0)];
    
    [readerView showPdfDocument:document];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
