const { ethers } = require("hardhat");
const { expect } = require("chai");

describe("Deploy Gas Challenge Contract", () => {
  let gas_contract;

  beforeEach(async () => {
    const gas_challenge_contract = await ethers.getContractFactory(
      "gasChallenge"
    );
    gas_contract = await gas_challenge_contract.deploy();
  });

  describe("Compute Gas", () => {
    it("Should return lower gas", async () => {
      await gas_contract.notOptimizedFunction();
      await gas_contract.optimizedFunction();
    });
  });

  describe("Check Sum Of Array", () => {
    it("Should return 0", async () => {
      await gas_contract.optimizedFunction(); // Runs the optimizedFunction to set the array elements to 0
      const sum = await gas_contract.getSumOfArray(); // Gets the sum of the array after running the optimizedFunction
      expect(sum).to.equal(0); // Asserts that the sum is equal to 0
    });
});
  
});