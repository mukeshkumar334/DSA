/*
Given a sorted array of size N and an integer K. Check if K is present in the array or not using ternary search.
Ternary Search - It is a divide and conquer algorithm that can be used to find an element in an array. 
It is similar to binary search where we divide the array into two parts but in this algorithm, we divide the 
given array into three parts and determine which has the key (searched element).
Input:
N = 5, K = 6
arr[] = {1,2,3,4,6,8}
Output: 1
Exlpanation: Since, 6 is present in 
the array at index 4 (0-based indexing),
output is 1.

Example 2:

Input:
N = 5, K = 2
arr[] = {1,3,4,5,7}
Output: -1
Exlpanation: Since, 2 is not present 
in the array, output is -1.
*/
class Solution {

    static int ternarySearch(int arr[], int N, int K) {
        return search(arr, 0, N-1, K);
    }
    
    static int search(int arr[], int l, int r, int K) {
        if (l > r) {
           return -1;
        }
        
        int firstMid = l + (r-l)/3;
        int secondMid = l + (2*(r-l))/3;
        
        if (K == arr[firstMid]) {
            return 1;
        } else if (K == arr[secondMid]) {
            return 1;
        } else if (K<arr[firstMid]) {
            return search(arr, l, firstMid-1, K);
        } else if (K>arr[firstMid] && K<arr[secondMid]) {
            return search(arr, firstMid+1, secondMid-1, K); 
        } else if  (K>arr[secondMid] && K<arr[r]) {
            return search(arr, secondMid+1, r, K);
        } else if (K==arr[r]) {
            return 1;
        }
        
        return -1;
    }
}
