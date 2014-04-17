/
###Project Euler###

Largest prime factor
Problem 3
----------------------------------------------------------------------------
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
----------------------------------------------------------------------------
\

/======================
/## Solution & Explanation in Q ##
/======================

p3: 600851475143; / assign number in problem to p3

/#--------------------------------------------------------------------
/#returns whether a value greater than or equal to 2 is prime
/#--------------------------------------------------------------------
isPrime:{
	/ ignores values under two as the function below drops 0 and 1 from the enumeration
	$[x < 2; 	
	0b; 
	
	/ if the smallest remainder up to the value is 1, it has no factors and therefore is prime
	1=min x mod 2_ til x 	
	] }; 

/#----------------------------------------------------
/#checks for factor s of p3 between 0 and 10^x
/#----------------------------------------------------	
factorsTil: {
	b: til `int$(10 xexp x); / enumerates the number of values to check against factors
	
	b @ where 0 < { /indexes b with positive values
	
		$[(p3 div x) = p3%x; / compares the full division against div to return a factor
		
			x; / returns the value
			-1 / returns a negative number to be ignored by the where statement
		
		]} each b}; / checks for factor over the enumeration

/#----------------------------------------------------------------------------------------------------	
/#exhaustively looks through the factors of x within a recursively increasing range for the 
/#largest prime factor
/#----------------------------------------------------------------------------------------------------
primeFactors: {
	f: factorsTil x; / return the factors of p3 in range 0 to 10^x
	p: f@where isPrime each f; / select the factors that are prime
	
	$[p3 = prd p; / check if the product of the prime factors is equal to p3
	
		max p; / returns the largest value i.e. largest prime factor
		
		primeFactors[1+x] / otherwise call back with increased range
	]};
	
/==============
/## Solution in K4 ##
/==============

k)isPrimeK: {
	$[x<2;
		0b;
		1 = &/ x {x-y*x div y}/: 2_!x / mod in K3 is dyadic !, this has been changed in K4
	]};
	
k)factorsTilK: {
	b:!`int$(10 xexp 2); / casting didn't exist in K3, and xexp was ^
	b@&0>{
		$[(p3 div x)=p3%x;
			x;
			-1;
		]}'b};

k)primeFactorsK: {
	f: factorsTilK x;
	p: f@& isPrimeK'f;
	$[p3 = */p;
		|/p;
		primeFactorsK[1+x]
	]};
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		