# Gas Optimization Bounty by StackUp

![12 July - Gas Optimisation Challenge](https://github.com/clement-stackup/gas_challenge/assets/120361535/21c826fb-8776-4837-a8fe-b7040426eafa)

## Overview of Bounty

Gas is the unit of measurement for the computational work required to execute a transaction or deploy a smart contract on the Ethereum blockchain. Gas optimization techniques are important because they can significantly reduce the cost of deploying and executing smart contracts, making them more affordable for users.

This bounty challenges you to optimize a smart contract by applying the various listed gas optimization techniques. To complete this bounty, you must apply the techniques described below to the provided smart contract and write a simple unit test. Once you are done, upload your working files to your GitHub repository and submit the GitHub URL to successfully complete the bounty.

## Overview of Gas Optimization Techniques

To successfully complete this bounty, you will need to apply the following gas optimization techniques:

1. **Fixed Size over Dynamic Arrays**: Using fixed-size arrays instead of dynamic arrays can reduce gas consumption because Solidity has to perform less work to manage the memory allocation of arrays in the smart contract

2. **Caching State Variable**: Caching frequently accessed state variable can reduce gas consumption by reducing the number of storage reads required

3. **Implement Uncheck Block**: Using the `unchecked` block can reduce gas consumption by skipping certain checks such as integer overflows

4. **For Loop Increment Syntax**: Using a different for loop increment syntax can help reduce gas consumption

## Getting Started

To get started, clone this repository to your local machine and navigate to the project directory. Next, install the required dependencies.

```bash
git clone https://github.com/clement-stackup/gas_challenge.git
cd gas_challenge && npm install
```

Once you have cloned the repository and installed the necessary dependencies, open the `contracts/gasChallenge.sol` file to view the smart contract and apply the following gas optimization techniques above.
This is how my optimized code looks like:

**Optimized Code:**
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    uint[10] numbers = [1,2,3,4,5,6,7,8,9,10]; // Using fixed-size array
    
    // Function to calculate the sum of the array
    function getSumOfArray() public view returns (uint256) {
        uint sum = 0; // Initialize the sum variable
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

```


## Test Smart Contract

I headed over to `test/test_gasChallenge.js` and wrote a unit test under the describe block to check that after running the gas optimized function, the sum of array is 0. 

``` Javascript
describe("Check Sum Of Array", () => {
    it("Should return 0", async () => {
      await gas_contract.optimizedFunction(); // Runs the optimizedFunction to set the array elements to 0
      const sum = await gas_contract.getSumOfArray(); // Gets the sum of the array after running the optimizedFunction
      expect(sum).to.equal(0); // Asserts that the sum is equal to 0
    });
});

```


I proceeded to run the following command to test the smart contract.

```bash
npx hardhat test
```

This command will test the smart contract and compute the estimated gas cost. This is computed using the [hardhat-gas-reporter](https://www.npmjs.com/package/hardhat-gas-reporter) library.

The library output the estimated gas costs to a new `gas-report.txt` file on my root directory. You can then view the estimated gas consumption for each of the smart contract functions in this file. The `optimizedFunction()` should output a lower gas consumption to the `notOptimizedFunction()` as shown below.

The output shows that all tests passed successfully and no errors were encountered during testing:
![Gas Report Screenshot](<assets/Gas Report Screenshot.png>)

This command also checked if the sum of the array returned 0. You can refer below to view the terminal console, all tests have passed!

![Console screenshot](<assets/console screenshot.png>)

## Bounty Submission

Upload all your working files to your GitHub Repository and submit your GitHub Repository URL to the StackUp Gas Optimization Challenge Bounty Page to successfully complete this challenge!

