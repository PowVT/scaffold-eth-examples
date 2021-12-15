# Rebase/ Reflect/ Elastic Tokens 🪞

This repository shows the inner workings of a unique token concept called 'rebase' tokens. Rebase tokens are also known as 'reflective' tokens or 'elastic' tokens due to the way the protocol behaves. This type of protocol was developed in order to split a trasnaction tax accross all holders of a coin, WITHOUT making separate txs to everyone. In this example the reflective tax used is 2%. This means upon every transaction, 2% of that transaction is split between all holders of the coin. The split is weighted meaning accounts with higher balances with recieve more of the 2% and accounts with lower balances. 

Be careful when using this type of protocol for it differs from a tradional ERC20 token and for this reason is known to cause issues with some exchanges. 

It can be noticed the protocol also has a 'withdraw' function this can be used by the contract owner to remove other ERC20 tokens that get sent to the contract externally. 

# Speed Run 🏃

1. Change constructor to mint total supply to your burner wallet, upon deploy. Save contract.
2. Deploy rebase token to local chain. Yarn Deploy.
3. Check balance of your burner wallet. Should be 1 Billion tokens.
    - ![image](https://scaffold-eth-readme-images.s3.amazonaws.com/Screenshot+2021-12-15+120904.png)
4. Next send 100 tokens to another wallet like punkwallet.io or metmask.io.
    - ![image](https://scaffold-eth-readme-images.s3.amazonaws.com/Screenshot+2021-12-15+121019.png)
5. Check the totalFees variable.
    - ![image](https://scaffold-eth-readme-images.s3.amazonaws.com/Screenshot+2021-12-15+121416.png)
6. Check balance of the senders account. Should be ((totalSupply - 100) + reflection).
    - ![image](https://scaffold-eth-readme-images.s3.amazonaws.com/Screenshot+2021-12-15+121434.png)
7. Check balance of the recievers account. Should be (100 - (2% tax) + reflection).
    - ![image](https://scaffold-eth-readme-images.s3.amazonaws.com/Screenshot+2021-12-15+121452.png)
8. Notive if you add the reflections together you will get the totalFees accumulated.
    - totalReflection = 1.999999803999999607 + 0.000000196000000392 = 2 = 100 * 0.02 = txAmount * reflectTax

*** As more and more transactions occur holders of the token can recieve more tokens from just holding their coins. The flip side is that the rich get richer and the poorer accounts dont see a very high reflection rate since it is based of the amount of tokens in your account. The proportion of tokens your account holds compared to the total supply is the proportion of the reflection you recieve in each transfer and this can be seen in the speed run example. 

### Side Quests

1. You will notice in the smart contract there is a mapping for 'excluded addresses'. This means any addresses in this mapping with the bool set to true will not recieve reflections upon token transfers. 

2. Change the reflect percentage to a number other than 2!

3. Calculate going from the tSpace to the rSpace and back again using the current rate. The current rate can be found using 'getRate()' function. This exercise can be extended to how the 'balanceOf' function works. Notice in the 'balanceOf' function, the account parameter is passed to a function called 'tokenFromReflection()'.

# Quick Start 🏄 

Prerequisites: [Node](https://nodejs.org/en/download/) plus [Yarn](https://classic.yarnpkg.com/en/docs/install/) and [Git](https://git-scm.com/downloads)

> clone/fork 🏗 scaffold-eth:

```bash
git clone https://github.com/austintgriffith/scaffold-eth.git rebase-token
cd rebase-token
git checkout rebase-token
yarn install
```

> install and start your 👷‍ Hardhat chain:

```bash
cd rebase-token
yarn chain
```

> in a second terminal window, start your 📱 frontend:

```bash
cd rebase-token
yarn start
```

> in a third terminal window, 🛰 deploy your contract:

```bash
cd rebase-token
yarn deploy
```

🔏 Edit your smart contract `rebaseToken.sol` in `packages/hardhat/contracts`

📝 Edit your frontend `App.jsx` in `packages/react-app/src`

💼 Edit your deployment scripts in `packages/hardhat/deploy`

📱 Open http://localhost:3000 to see the app

# 📚 Documentation

Documentation, tutorials, challenges, and many more resources, visit: [docs.scaffoldeth.io](https://docs.scaffoldeth.io)

# 🔭 Learning Solidity

📕 Read the docs: https://docs.soliditylang.org

