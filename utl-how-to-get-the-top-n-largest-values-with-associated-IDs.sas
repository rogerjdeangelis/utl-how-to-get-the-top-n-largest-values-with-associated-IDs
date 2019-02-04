How to get the top 2 largest values with associated IDs                                                                     
                                                                                                                            
Github                                                                                                                      
https://tinyurl.com/y76slpph                                                                                                
https://github.com/rogerjdeangelis/utl-how-to-get-the-top-n-largest-values-with-associated-IDs                              
                                                                                                                            
Also                                                                                                                        
https://tinyurl.com/y88g6ngk                                                                                                
https://github.com/rogerjdeangelis/utl-proc-means-output-observation-id-associated-with-max-and-min-age                     
                                                                                                                            
StackOverflow                                                                                                               
https://tinyurl.com/y7byn7c4                                                                                                
https://stackoverflow.com/questions/54416122/how-to-get-the-second-max-and-third-max-records-of-date-column-in-sas          
                                                                                                                            
Longfish profile ( I added an ID variable)                                                                                  
https://stackoverflow.com/users/1164962/longfish                                                                            
                                                                                                                            
                                                                                                                            
INPUT                                                                                                                       
=====                                                                                                                       
                                                                                                                            
proc SQL;                                                                                                                   
                                                                                                                            
create table have (                                                                                                         
  grp int,                                                                                                                  
  date date,                                                                                                                
  score int                                                                                                                 
);                                                                                                                          
                                                                                                                            
insert into have                                                                                                            
values (10001, "2Jan2018"d, 2)                                                                                              
values (10001, "29Jan2019"d, 18)                                                                                            
values (10001, "2Jan2018"d, 5)                                                                                              
values (10001, "26Jan2019"d, 11)                                                                                            
values (10001, "27Jan2019"d, 12)                                                                                            
values (10001, "2Jan2018"d, 13)                                                                                             
values (10001, "26Jan2019"d, 14)                                                                                            
values (10002, "27Jan2019"d, 15)                                                                                            
values (10002, "2Jan2018"d, 25)                                                                                             
values (10002, "2Jan2018"d, 32)                                                                                             
values (10002, "26Jan2019"d, 28)                                                                                            
values (10002, "27Jan2019"d, 18)                                                                                            
values (10002, "2Jan2018"d, 5)                                                                                              
values (10002, "2Jan2018"d, 2)                                                                                              
values (10002, "2Jan2018"d, 12)                                                                                             
values (10002, "2Jan2018"d, 12)                                                                                             
values (10002, "26Jan2019"d, 13)                                                                                            
values (10002, "27Jan2019"d, 14)                                                                                            
;                                                                                                                           
quit;                                                                                                                       
                                                                                                                            
                                                                                                                            
HAVE total obs=18                                                                                                           
                                  | RULES                                                                                   
Obs     GRP      DATE      SCORE  | -----                     Next                                                          
                                  |        Largest            Largest                                                       
  1    10001    02JAN18       2   |   GRP  SCORE_1   DATE_1   SCORE_2  DATE_2                                               
  2    10001    29JAN19*     18*  |                                                                                         
  3    10001    02JAN18       5   |  10001    18    29JAN19      14   26JAN19                                               
  4    10001    26JAN19      11   |                                                                                         
  5    10001    27JAN19      12   |                                                                                         
  6    10001    02JAN18      13   |                                                                                         
  7    10001    26JAN19*     14*  |                                                                                         
                                  |                                                                                         
  8    10002    27JAN19      15   |  10002    32    02JAN18      28   26JAN19                                               
  9    10002    02JAN18      25   |                                                                                         
 10    10002    02JAN18*     32*  |                                                                                         
 11    10002    26JAN19*     28*  |                                                                                         
 12    10002    27JAN19      18   |                                                                                         
 13    10002    02JAN18       5   |                                                                                         
 14    10002    02JAN18       2   |                                                                                         
 15    10002    02JAN18      12   |                                                                                         
 16    10002    02JAN18      12   |                                                                                         
 17    10002    26JAN19      13   |                                                                                         
 18    10002    27JAN19      14   |                                                                                         
                                                                                                                            
                                                                                                                            
EXAMPLE OUTPUT                                                                                                              
--------------                                                                                                              
                                                                                                                            
WANT total obs=2                                                                                                            
                                                                                                                            
Obs     GRP  SCORE_1   DATE_1   SCORE_2  DATE_2                                                                             
                                                                                                                            
 1     10001    18    29JAN19      14   26JAN19                                                                             
 2     10002    32    02JAN18      28   26JAN19                                                                             
                                                                                                                            
*          _       _   _                                                                                                    
 ___  ___ | |_   _| |_(_) ___  _ __                                                                                         
/ __|/ _ \| | | | | __| |/ _ \| '_ \                                                                                        
\__ \ (_) | | |_| | |_| | (_) | | | |                                                                                       
|___/\___/|_|\__,_|\__|_|\___/|_| |_|                                                                                       
                                                                                                                            
;                                                                                                                           
                                                                                                                            
proc summary data=have nway;                                                                                                
class grp;                                                                                                                  
var score;                                                                                                                  
output out=want (drop=_:)                                                                                                   
    idgroup(max(score) out[2] (score date) = score date);                                                                   
run;                                                                                                                        
                                                                                                                            
                                                                                                                            
                                                                                                                            
                                                                                                                            
                                                                                                                            
