//
//  ViewController.m
//  test
//
//  Created by Mark Shepherd on 1/18/16.
//  Copyright © 2016 Mark Shepherd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *S = @"0 - 22 1985--324";
    
    [self solution:S];
}

-(NSString *) solution :(NSString*)S{
    
    //Expandable String with length of 200
    NSMutableString *solutionString = [NSMutableString stringWithCapacity:200];
    
    //Solution counter to add "-" dash every 3 characters
    int solutionCounter=0;
    
    //Loop through individual characters for input
    for(int i=0; i<=[S length]-1;i++){
        NSRange range = NSMakeRange(i, 1);
        
        if ([[S substringWithRange:range] isEqual:@" "]  || [[S substringWithRange:range] isEqual:@"-"]  ){
            
            //Do nothing & avoid discard unecessary spaces and charaters from string
            
        }
        else{
            
            //append to solution string
            if(solutionCounter==3){
                
                [solutionString appendString:@"-"];
                
                //Reset Solution Counter after 3rd character
                solutionCounter=0;
            }
            
            [solutionString appendString:[S substringWithRange:range]];
            solutionCounter++;
            
        }
        
    }
    
    NSLog(@"%@", solutionString);
    
    if([[solutionString substringWithRange:NSMakeRange(solutionString.length-2, 1)] isEqual:@"-"]){
        
        NSLog(@"%@",[solutionString substringWithRange:NSMakeRange(solutionString.length-3, 2)]);
        
        //temporary string to switch last two digits
        NSMutableString *temp =[NSMutableString stringWithCapacity:2];
        
        //put the dash before the number
        [temp appendString:[solutionString substringWithRange:NSMakeRange(solutionString.length-2, 1)]];
        [temp appendString:[solutionString substringWithRange:NSMakeRange(solutionString.length-3, 1)]];
        NSLog(@"%@", temp);
        
        [solutionString replaceCharactersInRange:NSMakeRange(solutionString.length-3, 2) withString:temp];
        NSLog(@"%@", solutionString);
        
        
    }
    return solutionString;
} 

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
