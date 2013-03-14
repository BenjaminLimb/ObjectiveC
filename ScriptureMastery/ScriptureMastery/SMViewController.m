//
//  SMViewController.m
//  ScriptureMastery
//
//  Created by Benjamin Limb on 3/4/13.
//  Copyright (c) 2013 Benjamin Limb. All rights reserved.
//

#import "SMViewController.h"

@interface SMViewController ()

@end

@implementation SMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _scriptureSource = @"Now these sons of Mosiah were with Alma at the time the angel first appeared unto him;  therefore Alma did rejoice exceedingly to see his brethren; and what added more to his Joy, they were still his brethren in the Lord; yea, and they had waxed strong in the knowlege of the truth; for they were men of a sound understanding and they had searched the scritpures diligently, that they might know the word of God.    But this is not all; they had given themselves to much prayer and fasting; therefore they had the spirit of prophesy, and the spirit of revelation, and when they taught, they taught with power and authority of God.";
    
    _toggleSate = TRUE;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) populateLetters{
    
    NSArray *myArray;
    NSDate *aDate = [NSDate distantFuture];
    NSValue *aValue = [NSNumber numberWithInt:5];
    NSString *aString = @"a string";
    
    myArray = [NSArray arrayWithObjects:aDate, aValue, aString, nil];

    NSMutableData *output = [[NSMutableData alloc] init];
    
    NSArray *parse  = [_scriptureSource componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet ]];
    for (NSString * currentWord in parse) {
        
        if(currentWord.length){
            
            char currentChar = [currentWord characterAtIndex:0];
            char lastChar = [currentWord characterAtIndex:currentWord.length-1];
            
            [output appendBytes:&currentChar length:1];
            
            if([[NSCharacterSet punctuationCharacterSet] characterIsMember:currentChar ] ){
                [output appendBytes:&currentChar length:1];
            }
            if([[NSCharacterSet punctuationCharacterSet] characterIsMember:lastChar ] ){
                [output appendBytes:&lastChar length:1];
            }
            
      
        }

    }
    
    char nullTerminator = '\0';
    
     [output appendBytes:&nullTerminator length:1];
    
    NSString* cleanOutput = [NSString stringWithUTF8String:[output bytes]];
    
   // NSString *cleanOutput = [[NSString alloc] initWithBytes:output length:output.length encoding:NSUTF8StringEncoding];
    
      NSLog(@"%@",cleanOutput);
    
  //    NSString *token = @"";
    
//    NSLog(@"Test");
//    for (int i = 0; i < parse.count; i++){
//        NSLog(@"%@",parse[i]);
 // }
    /*
    Boolean inWord = false;
    
    for(int i = 0; i < _scriptureSource.length;i++){
        char currentChar = [_scriptureSource characterAtIndex:i];
        NSLog(@"%c",currentChar);
        
    }
*/
}

- (IBAction)toggleVisible:(id)sender {
    NSString *text = @"";
    text = [_scriptureText text];
   
    if (_toggleSate){
         _scriptureText.text = _scriptureLetters;
        _toggleSate = FALSE;
        [self populateLetters];
        
    }
    else{
         _scriptureText.text = _scriptureSource;
        _toggleSate = TRUE;
        
        
    }
}
@end









