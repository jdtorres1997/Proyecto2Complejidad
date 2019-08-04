var int: pagInternational;
var bool: international;
var int: pagNational;
var bool: national;
var int: pagLocalNews;
var bool: localNews;
var int: pagSports;
var bool: sports;
var int: pagCulture;
var bool: culture;

constraint pagInternational >= 5;
constraint pagInternational <= 9;
constraint pagNational >= 4; 
constraint pagNational <= 7; 
constraint pagLocalNews >= 2; 
constraint pagLocalNews <= 5; 
constraint pagSports >= 2;
constraint pagSports <= 4; 
constraint pagCulture >= 1; 
constraint pagCulture <= 3; 
constraint pagInternational*international+pagNational*national+pagLocalNews*localNews+pagSports*sports+pagCulture*culture<=10;

solve maximize 1500*pagInternational*international+2000*pagNational*national+1000*pagLocalNews*localNews+1500*pagSports*sports+750*pagCulture+culture;