//
//  ThreadSafeForMutableArray.m
//  MultiDownloaderDemo
//
//  Created by Doan Van Vu on 8/29/17.
//  Copyright © 2017 Doan Van Vu. All rights reserved.
//

#import "ThreadSafeForMutableArray.h"

@interface ThreadSafeForMutableArray()

@property (nonatomic) dispatch_queue_t threadSafeForArrayQueue;
@property (nonatomic) NSMutableArray* threadSafeArray;

@end

@implementation ThreadSafeForMutableArray

#pragma mark - init

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        _threadSafeArray = [[NSMutableArray alloc]init];
        _threadSafeForArrayQueue = dispatch_queue_create("ARRAY_QUEUE", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

#pragma mark - addObject

- (void)addObject:(NSObject *)object {
    
    if (object == nil) {
        
        NSLog(@"Object must be nonnull");
        return;
    }
    
    dispatch_barrier_async(_threadSafeForArrayQueue, ^{
        
        [_threadSafeArray addObject:object];
    });
}

#pragma mark - removeObject

- (void)removeObject:(NSObject *)object {
    
    if (object == nil) {
        
        NSLog(@"Object must be nonnull");
        return;
    }
    
    dispatch_barrier_async(_threadSafeForArrayQueue, ^{
        
        [_threadSafeArray removeObject:object];
    });
}

#pragma mark - removeObjectAtIndex

- (void)removeObjectAtIndex:(NSUInteger)index {
    
    dispatch_barrier_async(_threadSafeForArrayQueue, ^{
        
        [_threadSafeArray removeObjectAtIndex:index];
    });
}

#pragma mark - objectAtIndex

- (id)objectAtIndex:(NSUInteger)index {
    
    id __block object;
    
    dispatch_sync(_threadSafeForArrayQueue, ^{
        
        object = [_threadSafeArray objectAtIndex:index];
    });
    
    return object;
}

#pragma mark - count

- (NSUInteger)count {
    
    NSUInteger __block count;
    
    dispatch_sync(_threadSafeForArrayQueue, ^{
        
        count = [_threadSafeArray count];
    });
    
    return count;
}

#pragma mark - filteredArrayUsingPredicate

- (NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate {
    
    NSArray __block* result;
    
    dispatch_sync(_threadSafeForArrayQueue, ^{
        
        result = [_threadSafeArray filteredArrayUsingPredicate:predicate];
    });
    
    return result;
}

#pragma mark - enumerateObjectsUsingBlock

- (void)enumerateObjectsUsingBlock:(void (^)(id object, NSUInteger idx, BOOL* stop))block {
    
    NSArray* array = _threadSafeArray;
    
    dispatch_sync(_threadSafeForArrayQueue, ^{
        
        [array enumerateObjectsUsingBlock:block];
    });
}

#pragma mark - sortedArrayUsingDescriptors

- (NSArray *)sortedArrayUsingDescriptors:(NSString *)field {
    
    NSArray __block* result;
    
    dispatch_sync(_threadSafeForArrayQueue, ^{
        
        NSSortDescriptor* sortDescriptor = [[NSSortDescriptor alloc] initWithKey:field ascending:NO];
        result = [_threadSafeArray sortedArrayUsingDescriptors:@[sortDescriptor]];
    });
    
    return result;
}

#pragma mark - removeAllObjects

- (void)removeAllObjects {
    
    // Check nonempty array
    NSUInteger numberOfElements = [self count];
    
    if (numberOfElements == 0) {
        
        NSLog(@"Array is empty");
        return;
    }
    
    // Remove all objects from array
    dispatch_async(_threadSafeForArrayQueue, ^{
        
        [_threadSafeArray removeAllObjects];
    });
}

@end
