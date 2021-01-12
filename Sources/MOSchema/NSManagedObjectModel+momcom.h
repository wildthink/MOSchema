//
//  NSManagedObjectModel+momcom.h
//  momc
//
//  Created by Tom Harrington on 4/17/13.
//  Copyright (c) 2013 Tom Harrington. All rights reserved.
//

@import CoreData;

@interface NSManagedObjectModel (momcom)

- (instancetype)initWithXml:(NSXMLDocument *)sourceModelDocument error:(NSError **)error;

- (instancetype)initWithSourceURL:(NSURL *)sourceModelURL error:(NSError **)error;

+ (NSManagedObjectModel *)compileFromDocument:(NSXMLDocument *)sourceModelDocument error:(NSError **)error;
+ (NSString *)compileModelAtPath:(NSString *)modelPath inDirectory:(NSString *)resultDirectoryPath error:(NSError **)error;

@end
