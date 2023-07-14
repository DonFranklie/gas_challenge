// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    uint[10] numbers = [1,2,3,4,5,6,7,8,9,10]; // Using fixed-size array
    
    // Function to calculate the sum of the array
    function getSumOfArray() public view returns (uint256) {
        uint sum = 0; // Initializes the sum variable
        for (uint i = 0; i < numbers.length; i++) {
            sum += numbers[i]; // Adds each element of the array to the sum
        }
        return sum; // Returns the final sum
    }
    
    // Function that sets each element of the array to 0 (not optimized)
    function notOptimizedFunction() public {
        for (uint i = 0; i < numbers.length; i++) {
            numbers[i] = 0; // Sets each element to 0
        }
    }
    
    // Function that sets each element of the array to 0 (optimized)
    function optimizedFunction() public {
        unchecked { // Using unchecked block to skip overflow checks
            for (uint i = 0; i < numbers.length; i++) {
                numbers[i] = 0; // Sets each element to 0
            }
        }
    }
}
