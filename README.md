# binary-search2

Emurgo Project 

This binary search project utilizes higher-order functions, monads, and transformers to perform a binary search on a list of numbers.

First, the MaybeT monad transformer is imported from the Control.Monad.Trans.Maybe module. This allows the binary search to return a Maybe value indicating whether the target number was found or not.

The binarySearch function takes two arguments - a comparison function f and a list xs of values to search. The f function should take two arguments of the same type as the values in the list and return an Ordering value.

The binarySearch function uses the MaybeT transformer to wrap the result of the binary search in a Maybe value. It then calls the binarySearch' function to perform the actual search.

The binarySearch' function takes four arguments - the list to search, the target value, and two indices representing the lower and upper bounds of the search space. It uses the comparison function f to determine whether the target value is less than, greater than, or equal to the value in the middle of the search space. Depending on the result, the search space is either reduced to the lower or upper half or the target value is found and returned.

In the main function, a list of numbers is created and a target value is selected. The binarySearch function is called with the (<) comparison function and the list and target value as arguments. The result is then unwrapped from the MaybeT monad transformer and printed to the console indicating whether the target was found or not.

