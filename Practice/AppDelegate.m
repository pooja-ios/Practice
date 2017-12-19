//
//  AppDelegate.m
//  Hi
//
//  Created by pooja on 12/06/2017.
//  Copyright © 2017 pooja. All rights reserved.
//

#import "AppDelegate.h"
#import "Person.h"
#import "Practice-Swift.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSLog(@"%d", [self foo:513 r:2]);
    
    NSLog(@"%@", [self solution:@"lklo"]);
    NSLog(@"%@", [self solution:@"lokoklol"]);
    
    [self printStartReverse];
    
    [self printStars];
    
    [self findSmallest];
    
    [self getRepeatIndex];
    
    NSArray *population = [NSArray arrayWithObjects:@"200", @"500", @"300", @"400", @"200", nil];
    [self getMaxPeople:100 inCities:5 forPopulation:population];
    
    NSMutableArray *sorted = [self mergesort:[NSArray arrayWithObjects:[NSNumber numberWithInteger:14], [NSNumber numberWithInteger:33], [NSNumber numberWithInteger:27], [NSNumber numberWithInteger:10], [NSNumber numberWithInteger:35], [NSNumber numberWithInteger:19], [NSNumber numberWithInteger:42], [NSNumber numberWithInteger:44], nil]];
    
    // 14, 33, 27, 10, 35, 19, 42, 44
    NSLog(@"%@", sorted);
    
    [self getAdditiveSum];
    
    [self getTotalNumberOfGames:20 withDiscount:3 withMinimum:6 withDollar:85];
    
    [self findMaxPopulationYear];
    
    [self getIdentifier];
    
    [self test];
    
    [AlgoTest binarySearch];
    
    return YES;
}

-(void)test
{
    NSInteger boxCount = 5;
    NSMutableArray *ballsArr = [[NSMutableArray alloc] init];
    for (NSInteger ballCount = 0; ballCount < boxCount; ballCount++)
    {
        [ballsArr addObject:[NSNumber numberWithInteger:ballCount+1]];
    }
    
    NSInteger K = 3;
    //NSInteger F = 5;
    
    // Initialize result
    int sum = 0;
    
    // Fix the first element as A[i]
    for (int i = 0; i < K-2; i++)
    {
        // Fix the second element as A[j]
        for (int j = i+1; j < K-1; j++)
        {
            // Now look for the third number
            for (int k = j+1; k < K; k++)
                if ([ballsArr[i] integerValue] + [ballsArr[j] integerValue] + [ballsArr[k] integerValue] < sum)
                    sum++;
        }
    }
}


-(void)findMaxPopulationYear
{
    Person *p1 = [[Person alloc] init];
    p1.birth = 1900;
    p1.death = 1975;
    
    Person *p2 = [[Person alloc] init];
    p2.birth = 1970;
    p2.death = 2000;
    
    Person *p3 = [[Person alloc] init];
    p3.birth = 1950;
    p3.death = 1985;
    
    Person *p4 = [[Person alloc] init];
    p4.birth = 1900;
    p4.death = 1920;
    
    Person *p5 = [[Person alloc] init];
    p5.birth = 1910;
    p5.death = 1920;
    
    Person *p6 = [[Person alloc] init];
    p6.birth = 1915;
    p6.death = 1920;
    
    Person *p7 = [[Person alloc] init];
    p7.birth = 1919;
    p7.death = 1925;
    
    NSMutableArray *people = [NSMutableArray arrayWithObjects:p1, p2, p3, p4, p5, p6, p7, nil];
    
    NSMutableArray *allYears = [[NSMutableArray alloc] init];
    for (Person *p in people)
    {
        if (![allYears containsObject:[NSNumber numberWithInteger:p.birth]])
        {
            [allYears addObject:[NSNumber numberWithInteger:p.birth]];
        }
        
        if (![allYears containsObject:[NSNumber numberWithInteger:p.death]])
        {
            [allYears addObject:[NSNumber numberWithInteger:p.death]];
        }
    }
    
    allYears = [[allYears sortedArrayUsingSelector:@selector(compare:)] mutableCopy];
    
    NSMutableArray *population_changes = [[NSMutableArray alloc] init];
    
    for (int count = 0; count <= ([[allYears lastObject] integerValue] - [[allYears firstObject] integerValue]); count++)
    {
        [population_changes insertObject:[NSNumber numberWithInteger:0] atIndex:0];
    }
    
    for (Person *p in people)
    {
        NSInteger bIndex = p.birth - [allYears.firstObject integerValue];
        NSInteger bValue = [[population_changes objectAtIndex:bIndex] integerValue];
        NSInteger bNew = bValue +=1;
        [population_changes replaceObjectAtIndex:bIndex withObject:[NSNumber numberWithInteger:bNew]];
        
        NSInteger dIndex = p.death - [allYears.firstObject integerValue];
        NSInteger dValue = [[population_changes objectAtIndex:dIndex] integerValue];
        NSInteger dNew = dValue -=1;
        [population_changes replaceObjectAtIndex:dIndex withObject:[NSNumber numberWithInteger:dNew]];
    }
    
    NSInteger population = 0;
    NSInteger max_population = 0;
    NSInteger max_population_index = 0;
    
    for (NSNumber *value in population_changes)
    {
        population += [value integerValue];
        if (population > max_population)
        {
            max_population = population;
            max_population_index = [population_changes indexOfObject:value];
        }
    }
    
    NSLog(@" max population was in %ld year", [allYears.firstObject integerValue]+max_population_index);
}

-(void)getIdentifier
{
    NSString *url = @"45438812-31C2-4179-8E83-5AD947BB10B7";
    NSArray *items = [url componentsSeparatedByString:@"/"];
    
    if (items.count > 1)
    {
        NSString *name = [items lastObject];
        NSInteger start = [name rangeOfString:@"="].location;
        NSInteger end = [name rangeOfString:@"&"].location;
        name = [name substringWithRange:NSMakeRange(start+1, end-start-1)];
        NSLog(@"%@", name);
    }
    else
    {
        NSLog(@"%@", url);
    }
}

-(void)getTotalNumberOfGames:(int) price withDiscount:(int) discount withMinimum:(int) minimum withDollar:(int) dollars
{
    int games = 0;
    int cost = price;
    
    while (dollars > cost)
    {
        NSLog(@"cost : %d", cost);
        
        games++;
        dollars -= cost;
        
        cost = cost-discount;
        if (cost <= minimum) cost = minimum;
    }
    
    NSLog(@"%d", games);
}

-(void)getAdditiveSum
{
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
    NSArray *fav = @[@1000000000];
    NSArray *operations = @[@[@1, @2, @3]];
    
    for (int i = 0; i< operations.count; i++)
    {
        int sum = 0;
        int start = [[[operations objectAtIndex:i] objectAtIndex:0] intValue];
        int end = [[[operations objectAtIndex:i] objectAtIndex:1] intValue];
        int add = [[[operations objectAtIndex:i] objectAtIndex:2] intValue];
        
        for (NSNumber *num in [arr copy])
        {
            NSInteger position = [arr indexOfObject:num] + 1;
            
            int value = [num intValue];
            
            if (![fav containsObject:num] && position >= start && position <= end)
            {
                value = [num intValue] + add;
            }
            sum += value;
            
            [arr replaceObjectAtIndex:position-1 withObject:[NSNumber numberWithInt:value]];
        }
        
        NSLog(@"%d", sum);
    }
}

-(NSMutableArray *) mergesort:(NSArray *)a
{
    if ( a.count == 1 ) return a.mutableCopy;
    
    NSMutableArray *l1 = [a subarrayWithRange:NSMakeRange(0, a.count/2)].mutableCopy;
    
    NSInteger secondHalfIndex = a.count/2;
    NSMutableArray *l2 = [a subarrayWithRange:NSMakeRange(secondHalfIndex, a.count-secondHalfIndex)].mutableCopy;
    
    NSLog(@"l1 : %@", l1);
    NSLog(@"l2 : %@", l2);
    l1 = [self mergesort:l1];
    l2 = [self mergesort:l2];
    
    return [self merge:l1 and:l2];
}

-(NSMutableArray *) merge:(NSMutableArray *)a and:(NSMutableArray *)b
{
    NSLog(@"a: %@", a);
    NSLog(@"b: %@", b);
    
    NSMutableArray *c = [[NSMutableArray alloc] init];
    
    while (a.count > 0 && b.count > 0) {
        
        if (a[0] > b[0])
        {
            [c addObject:b[0]];
            [b removeObjectAtIndex:0];
        }
        else
        {
            [c addObject:a[0]];
            [a removeObjectAtIndex:0];
        }
    }
    
    while (a.count > 0) {
        [c addObject:a[0]];
        [a removeObjectAtIndex:0];
    }
    
    while (b.count > 0) {
        [c addObject:b[0]];
        [b removeObjectAtIndex:0];
    }
    
    NSLog(@"c: %@", c);
    return c;
}


-(void)printStars
{
    for (int i=1; i<=3; i++) {
        for (int j=1; j<=3-i; j++) {
            printf("_");
        }
        for (int k=1; k<=2*i-1; k++) {
            printf("x");
        }
        printf("\n");
    }
}

-(void)printStartReverse
{
    for (int i=3; i>=0; i--) {
        for (int j=1; j<=3-i; j++) {
            printf(" ");
        }
        for (int k=1; k<=2*i-1; k++) {
            printf("x");
        }
        printf("\n");
    }
}

-(NSString*) solution:(NSString*) S {
    int occurrences[26];
    
    for (int i = 0; i < 26; i++) {
        occurrences[i] = 0;
    }
    
    for (int i = 0; i < [S length]; i++) {
        char current = [S characterAtIndex:i];
        occurrences[current - 'a']++;
    }
    
    char best_char = 'a';
    int best_res = 0;
    
    for (int i = 0; i < 26; i++) {
        if (occurrences[i] > best_res) {
            best_char = 'a' + i;
            best_res = occurrences[i];
        }
    }
    
    NSString* result = [NSString stringWithFormat:@"%c", best_char];
    return result;
}



-(int)foo:(int)n r:(int)r
{
    if (n>0)
        return (n%r+[self foo:n/r r:r]);
    else return 0;
}

-(void)findSmallest
{
    NSArray *arr = [NSArray arrayWithObjects:[NSNumber numberWithInteger:1], [NSNumber numberWithInteger:3], [NSNumber numberWithInteger:4], [NSNumber numberWithInteger:5], nil];
    
    NSInteger res = 1; // Initialize result
    
    // Traverse the array and increment 'res' if arr[i] is
    // smaller than or equal to 'res'.
    for (int i = 0; i < arr.count && [[arr objectAtIndex:i] integerValue] <= res; i++)
    res = res + [[arr objectAtIndex:i] integerValue];
    
    NSLog(@"%ld", res);
}

-(void)getRepeatIndex
{
    NSArray *arr = [NSArray arrayWithObjects:@"5", @"10", @"3", @"4", @"6", nil];
    __block NSInteger firstIndex = -1;
    NSCountedSet *set = [NSCountedSet setWithArray:arr];
    [set enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        if ([set countForObject:obj] > 1)
        {
            if (firstIndex == -1) firstIndex = [arr indexOfObject:obj];
            else if ([arr indexOfObject:obj] < firstIndex) firstIndex = [arr indexOfObject:obj];
        }
    }];
    
    if (firstIndex >= 0) NSLog(@"%ld is index of first duplicate object %@", firstIndex, [arr objectAtIndex:firstIndex]);
    
}

-(long)getMaxPeople:(long)B inCities:(long)N forPopulation:(NSArray *)A
{
    //initializing
    long maxPeople = 0;
    
    //check for min and max values for cities and clinics
    if ((N >= 1 && N <= 500000) && (B >= N && B <= 2000000))
    {
        BOOL isError = NO;
        //check for min and max for number of people in each city
        for (int count = 0; count < A.count; count++)
        {
            long peopleInCity = [[A objectAtIndex:count] integerValue];
            
            if (!(peopleInCity >= 1 && peopleInCity <= 5000000))
            {
                isError = YES;
                break;
            }
        }
        
        if (!isError)
        {
            long totalPeople = 0;
            for (int count = 0; count < A.count; count++)
            {
                long peopleInCity = [[A objectAtIndex:count] integerValue];
                
                totalPeople += peopleInCity;
            }
            
            long peopleToBeTreated = totalPeople/B;
            NSLog(@"%ld people will get treated per city", peopleToBeTreated);
            return peopleToBeTreated;
        }
        else
        {
            //alert to fill population in range 1 to 5000000 only
        }
    }
    
    return maxPeople;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
