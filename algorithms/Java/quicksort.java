class Solution
{
    static void quickSort(int arr[], int low, int high)
    {
        if ( low > high) {
            return;
        }
        
        int pivot = partition(arr, low, high);
        quickSort(arr, low, pivot-1);
        quickSort(arr, pivot+1, high);
    }
    
    static int partition(int arr[], int low, int high)
    {
        int pivot = low;
        for (int i = low; i<high; i++) {
            if (arr[i] < arr[high]) {
                if (pivot != i) {
                    int temp = arr[i];
                    arr[i] = arr[pivot];
                    arr[pivot] = temp;
                }
                pivot += 1;
            } 
        }
        
        //put pivot element to it's place
       if (pivot < high) {
            int temp = arr[high];
            arr[high] = arr[pivot];
            arr[pivot] = temp;
        }

        return pivot;
    } 
}
