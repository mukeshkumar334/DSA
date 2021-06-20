/*
Power Of Numbers
Given a number and its reverse. Find that number raised to the power of its own reverse.
Note: As answers can be very large, print the result modulo 109 + 7.

Example 1:
Input:
N = 2
Output: 4
Explanation: The reverse of 2 is 2
and after raising power of 2 by 2 
we get 4 which gives remainder as 
4 by dividing 1000000007.

Example 2:

Input:
N = 12
Output: 864354781
Explanation: The reverse of 12 is 21
and 1221 , when divided by 1000000007 
gives remainder as 864354781.

Your Task:
You don't need to read input or print anything. You just need to complete the function pow() that takes two parameters N and R denoting the input number and its reverse and returns power of (N to R)mod(109 + 7).

Expected Time Complexity: O(LogN).
Expected Auxiliary Space: O(LogN).

Constraints:
1 <= N <= 105
*/
// { Driver Code Starts
//Initial Template for Java

/*package whatever //do not write package name here */

import java.io.*;
import java.util.*;
class Main {
    
class Solution {
    
   Dictionary<Integer, Long> result = new Hashtable<Integer, Long>();
    
    long power(int N,int R) {
        if (R == 1) {
            return N;
        }
        
        if (result.get(R) != null) {
            return result.get(R);
        } else {
            long part1 = power(N, R/2);
            long part2 = power(N, R-R/2);
            
            result.put(R/2, part1);
            result.put(R-R/2, part2);
            
            return part1 * part2 % 1000000007;
        }
    }
}

