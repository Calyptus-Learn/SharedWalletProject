# SharedWalletProject-Calyptus
Project: Create Your First Shared Wallet

Now that we’ve learn the basics of Solidity and worked with some basic smart contracts, let’s create our first complete dapp project.

We’ll create a shared wallet that will hold funds in ETH and that can be funded by an admin. The admin will provide an allowance to a few users who can then spend it as per their allowance and till a certain time limit set by the admin.

The entire flow will work as follows :

Admin deploys a smart contract that acts as a shared wallet
Admin funds the wallet with some ETH, this will be the wallet’s total balance
Admin authorises certain wallet addresses to spend a certain amount of ETH from the wallet within a certain time limit
Finally, the users can spend the ETH within their allowance and time limit, as set by the admin
In this project, we’ll learn the following :

Creating and deploying the smart contract that’ll act as the shared wallet
Creating a basic html and javascript based front-end for creating a UI that interacts with the smart contract
Integrating the frontend with the smart contract using ethers.js library
Writing ethers.js scripts to interact with the smart contract functions by just running these scripts via terminal
Although, the options 2 & 3 are optional. You can skip it if you don’t want to work on frontend. But we’d advise you to do it as it uses very basic html and you don’t need any advanced knowledge of frameworks like React, Angular etc. Nor would you need any CSS knowledge for styling the pages. The aim is to learn how a frontend page interacts with smart contracts using ethers.js library.

Let’s start with the smart contract. 
We’ll use Remix to write and deploy our smart contract. 
We’ll need the following functions in our smart contract for the entire functionality :
             1- A receive() function to fund the wallet contract
             2- A function to renew the allowance of a user by the admin
             3- A function to enable spending of coins by the user
             4- A function to check his/her allowance by a user
             5- A function to check the current total balance of the wallet
------------------------------------------------------------------------------------------------------------------------------------------------------------
