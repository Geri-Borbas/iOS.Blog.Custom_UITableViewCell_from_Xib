//
//  EPPZTableViewCell.m
//  eppz!tools
//
//  Created by Borbás Geri on 6/28/13.
//  Copyright (c) 2013 eppz! development, LLC.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "EPPZTableViewCell.h"


@interface EPPZTableViewCellOwner : NSObject
@property (nonatomic, weak) IBOutlet EPPZTableViewCell *cell;
+(id)ownerWithNibName:(NSString*) nibName;
@end

@implementation EPPZTableViewCellOwner
+(id)ownerWithNibName:(NSString*) nibName
{
    EPPZTableViewCellOwner *instance = [EPPZTableViewCellOwner new];
    [[NSBundle mainBundle] loadNibNamed:nibName owner:instance options:nil];
    return instance;
}
@end

@implementation EPPZTableViewCell

+(NSString*)reuseIdentifier { return NSStringFromClass(self); }
-(NSString*)reuseIdentifier { return NSStringFromClass(self.class); }

+(EPPZTableViewCell*)cellForTableView:(UITableView*) tableView
                          atIndexPath:(NSIndexPath*) indexPath
                      withModelSource:(id<EPPZTableViewCellModelSource>) modelSource
{
    EPPZTableViewCell *cell;
    
    //Get a cell instance (either dequeue from tableView or allocate a new one).
    cell = [tableView dequeueReusableCellWithIdentifier:[self reuseIdentifier]];
    if (cell == nil)
    {
        EPPZTableViewCellOwner *owner = [EPPZTableViewCellOwner ownerWithNibName:NSStringFromClass(self)];
        cell = owner.cell;
    }
    
    //Configure cell.
    if (modelSource != nil)
    {
        id model = [modelSource modelForIndexPath:indexPath];
        [cell configureWithModel:model];
    }

    return cell;
}

+(CGFloat)heightForTableView:(UITableView*) tableView atIndexPath:(NSIndexPath*) indexPath
{ return [self cellForTableView:tableView atIndexPath:indexPath withModelSource:nil].bounds.size.height; }

-(void)configureWithModel:(id) model
{ /* Subclass template. */ }

@end
