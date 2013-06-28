//
//  BRSessionVariantCelCell.m
//  eppz!tools
//
//  Created by Borbás Geri on 6/28/13.
//  Copyright (c) 2013 eppz! development, LLC.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "TCItemCell.h"


@implementation TCItemCell

-(void)configureWithModel:(id) model
{
    //Apply typeface.
    self.categoriesLabel.font = [UIFont fontWithName:@"Interstate" size:self.categoriesLabel.font.pointSize];
    self.titleLabel.font = [UIFont fontWithName:@"Interstate-Bold" size:self.titleLabel.font.pointSize];
    self.authorLabel.font = [UIFont fontWithName:@"Interstate" size:self.authorLabel.font.pointSize];
    self.dateLabel.font = [UIFont fontWithName:@"Interstate" size:self.dateLabel.font.pointSize];
    
    //Add, format content.
    self.categoriesLabel.text = [[[model valueForKey:@"categories"] componentsJoinedByString:@", "] uppercaseString];
    self.titleLabel.text = [model valueForKey:@"title"];
    self.authorLabel.text = [[model valueForKey:@"author"] uppercaseString];
    
    //Formatting date.
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateStyle = NSDateFormatterFullStyle;
    NSDate *publishedDate = [NSDate dateWithTimeIntervalSince1970:[[model valueForKey:@"published"] floatValue]];
    NSString *dateString = [dateFormatter stringFromDate:publishedDate];
    self.dateLabel.text = dateString;
}

@end
