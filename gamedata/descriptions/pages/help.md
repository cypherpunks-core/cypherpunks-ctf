&nbsp;
#### Game mechanics
Each level contract emits instances for players to manipulate, break, destroy, fix, etc. The player requests an instance, manipulates it and returns it to the game for evaluation of level completion. Both requesting instances and submitting instances back to the game are done with the buttons in the user interface in each level. Every instance is  wrapped in a `TruffleContract` object and exposes it in the browser's console. See the first level for a full tutorial on how to play the game.  


For more details about `TruffleContract`, you can refer to [Interacting with your contract](https://www.trufflesuite.com/docs/truffle/getting-started/interacting-with-your-contracts).

&nbsp;
#### Using the browser console
To play this game, we recommend using Chrome or Firefox as your browser.
Most game interaction is via the browser's console: `Dev Tools -> Console`. Open the console and enter the command:
```
help()
```
to see a list of objects and functions injected by the game to the console.
Since most interactions are asynchronous, we recommend using Chrome v62 which enables the `async`/`await` keywords in the console, so instead of writting:
```
getBalance(player)
> PROMISE
```
and opening the promise.

With await/async, you can write:
```
await getBalance(player)
> "1.11002387"
```

&nbsp;
#### MetaMask
In order to interact with blockchain, you need to have metamask installed on your browser. See [MetaMask](https://metamask.io/).

&nbsp;
#### Faucet
In order to play, nou need to have some testnet Ether. Visit [Faucet1](https://faucet.ropsten.be/) or [Faucet2](https://faucet.metamask.io/) to get some.

&nbsp;
#### Beyond the console
Some levels will require working outside of the browser console. That is, writing solidity code and deploying it in the network to attack the level's instance contract with another contract. This can be done in multiple ways, for example:
1) Use Remix to write the code and deploy it in the conrresponding network See [Remix Solidity IDE](http://remix.ethereum.org).

&nbsp;
#### Troubleshooting
Sometimes (a) the app state or (b) the MetaMask plugin state can become a bit messed up, specially after switching networks, unlocking, etc. If what you're seeing doesn't make much sense, try refreshing the app, hard-refreshing it, disabling and re-enabling your metamask plugin or even restarting your browser.
If you find issues, please open an issue at [cypherpunks-ctf]().
