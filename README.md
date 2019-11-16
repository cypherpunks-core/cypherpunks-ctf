# Ethernaut

<p>Cypherpunks CTF is a Web3/Solidity based wargame inspired in <a href="https://ethernaut.openzeppelin.com" target="_blank" rel="noopener noreferred">Ethernaut</a>, to be played in the Ethereum Virtual Machine. Each level is a smart contract that needs to be 'hacked'.</p>

*Level PR's are welcome!*

### Deploy

1. Install all the dependencies
```
git clone https://github.com/StillFantastic/Crosslink-Ethernaut.git
npm install
```
2. Compile contracts and get static frontend files
```
npm run deploy:ui
```

### Coontributing
See `contributing.md` on the repository for information about how to contribute.

#### Example level development

Let's suppose that we are creating a level.

1. Fork this repo, clone and npm install.
2. Implement the desired instance and factory logic in solidity. See current levels and notes to understand how the game mechanics work.
3. Register the level in gamedata/gamedata.json.
4. Deploy `cypherpunks.sol` by yourself, then replace the address of `cypherpunks` in gamedata/deploy.ropsten.json
5. Deploy your factory contract and Register your factory contract in `cypherpunks.sol` 
6. Start running application by `npm run start`
7. Add a description markdown file in gamedata/levels/ (make sure gamedata.json points to it). This content will now be displayed in the ui for the level.
8. Verify that the level is playable and winnable via UI. It is common for levels to be beatable in some way in tests that doesn't work using the UI, so it is important to test it manually as well.
9. Add a completed description markdown file, in gamedata/levels/ (make sure gamedata.json points to it). The level will display this as additional info once the level is solved, usually to include historical information related to the level.
10. Make a PR request so that we can re-deploy the game with the new level!
