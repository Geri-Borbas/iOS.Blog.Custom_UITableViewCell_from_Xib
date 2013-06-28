//
//  EPPZViewController.m
//  eppz!tools
//
//  Created by Borbás Geri on 6/28/13.
//  Copyright (c) 2013 eppz! development, LLC.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "EPPZViewController.h"
#import "AFNetworking.h"
#import "TCItemCell.h"


static NSString *const _feedUrl = @"http://www.google.com/reader/public/javascript/feed/http://feeds.feedburner.com/Techcrunch?n=100";

@interface EPPZViewController () <EPPZTableViewCellModelSource>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSDictionary *feed;
@end

@implementation EPPZViewController

#pragma mark - Load the feed content

-(void)viewDidAppear:(BOOL) animated
{
    [super viewDidAppear:animated];
    
    //Get feed, refresh table on completition.
    [[AFJSONRequestOperation JSONRequestOperationWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_feedUrl]] success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)
    {
        self.feed = JSON;
        [self.tableView reloadData];
    } failure:nil] start];
}


#pragma mark - Populate table

-(NSInteger)tableView:(UITableView*) tableView numberOfRowsInSection:(NSInteger) section
{ return [[self.feed valueForKey:@"items"] count]; }

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*) indexPath
{ return [TCItemCell heightForTableView:tableView atIndexPath:(NSIndexPath*) indexPath]; }

-(id)modelForIndexPath:(NSIndexPath*) indexPath
{ return [[self.feed valueForKey:@"items"] objectAtIndex:indexPath.row]; }

-(UITableViewCell*)tableView:(UITableView*) tableView cellForRowAtIndexPath:(NSIndexPath*) indexPath
{
    return [TCItemCell cellForTableView:tableView
                          atIndexPath:indexPath
                      withModelSource:self];
}

@end
