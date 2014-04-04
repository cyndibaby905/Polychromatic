//
//  SMQThemePreferencesViewController.m
//  Semantique
//
//  Created by Kolin Krewinkel on 3/31/14.
//  Copyright (c) 2014 Kolin Krewinkel. All rights reserved.
//

#import "SMQThemePreferencesViewController.h"
#import "Semantique.h"

@implementation SMQThemePreferencesViewController

#pragma mark - NSObject

- (id)init
{
    if ((self = [super init]))
    {
        DVTExtension *extension = [[DVTExtension alloc] init];
        [self setValue:extension forKey:@"representedExtension"];
    }

    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ((self = [super initWithNibName:self.className bundle:nibBundleOrNil]))
    {

    }

    return self;
}

#pragma mark - NSViewController

- (void)loadView
{
    [super loadView];
}

#pragma mark - DVTViewController

- (void)viewWillUninstall
{

}

#pragma mark - View Management

- (void)setupContentView
{
    NSView *contentView = [self.view valueForKey:@"contentView"];
    contentView.frame = contentView.superview.frame;

    self.themesTableView.dataSource = self;
    self.themesTableView.delegate = self;
}

#pragma mark - NSTableViewDataSource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return 30;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    return [tableView viewAtColumn:0 row:row makeIfNecessary:YES];
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
{
    return 37.f;
}

#pragma mark - Setters

- (void)setRepresentedExtension:(DVTExtension *)extension
{
    if (!self.representedExtension)
    {
        [super setRepresentedExtension:extension];
    }
}

- (void)setView:(NSView *)view
{
    [super setView:view];

    self.view.wantsLayer = YES;

    [self setupContentView];
}

#pragma mark - Sizing

- (CGFloat)preferredContentHeight
{
    return 472.f;
}

@end