# hammer-hodl

This is a smart contract inspired by one of the popular memes in Korean crypto culture, "Hammer Trading." The idea is that after purchasing, you metaphorically get hit on the head with a hammer, pass out, and wake up to a profit.

The key features of this contract are as follows:

- Withdrawals are prohibited until the WITHDRAWAL_START_TIME defined in the environment variables.
- Withdrawals can only be performed by the contract OWNER, and the withdrawal address must also be the owner's address.

[Warning] Anyone intending to use this contract must thoroughly review it before deployment. We bear no responsibility for any losses incurred through the use of this contract.

## Set up

```bash
npm install
cp .env_sample .env
vi .env
```

## Deploy

```bash
npx hardhat run --network {network} "script/deploy.js"
```

## Verify

```bash
npx hardhat verify --constructor-args arguments.js --contract "contracts/HammerHodl.sol:HammerHodl" --network {network} {contract address}
```