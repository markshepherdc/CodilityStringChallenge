# CodilityStringChallenge
Reformatting of a random string to phone numbers

Welcome to the CodilityStringChallenge wiki!

![](https://github.com/markshepherdc/CodilityStringChallenge/blob/master/question.png)

```objectivec
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


```objectivec
