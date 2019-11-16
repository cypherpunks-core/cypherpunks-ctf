pragma solidity ^0.4.24;

import './base/Level.sol';
import './Dragon.sol';

contract DragonFactory is Level {

  function createInstance(address _player) public payable returns (address) {
    _player;
    address[20] memory owner;
    owner[0] = 0xc13d5927171c4d9f017b7d48d127f1e9182f8981;
    owner[1] = 0x9b8bfc2990d5a8b4e1ffaa0999531d912f02225e;
    owner[2] = 0xa72e5fa5e7ad83ce47420bfd6cd92c18507f1699;
    owner[3] = 0xfc0172dda73d873e74e296b02f98e028cfaaf7f7;
    owner[4] = 0xf7355596424160bdcfe24627c7d89e48af6c033d;
    owner[5] = 0x4547d70673a8e37e9b09ce102d310a341475b6bf;
    owner[6] = 0x1a481cf354d424569267e3537690ac9c768120f1;
    owner[7] = 0x647f079f6939d071704348d41a45d88924fe0048;
    owner[8] = 0x1f65bd568276d40051b27c933a3ed2a6e584c961;
    owner[9] = 0xe10e75d4f3e4f52e2f83c6a2caa750488612749d;
    owner[10] = 0x987221d88a17cf03e5cab8dbee34887b7c3574e6;
    owner[11] = 0x10b4c586253b6b32e20b209d6502bac9ca148ff8;
    owner[12] = 0x667c60dc35afe4f1d15cdb0b58386809b1b000d8;
    owner[13] = 0xde676067527d982905c2113906c37a628dd9bb29;
    owner[14] = 0xe6de1fc093de2348cdaf28145fee041a059cd8a8;
    owner[15] = 0xe6ddb6bd86ee036226e39bf1463567cdf6637ce0;
    owner[16] = 0x69527a6c95281d96ea55281dd19e2e02008d644a;
    owner[17] = 0x5bd4e1253c9d2dc0c6ad6a9c6bd6b2b793f70d4e;
    owner[18] = 0xaacb9f4097c964d7f4d0d7c88b1f8e07702a1151;
    owner[19] = 0x0a8437409e7247c71352a439efe8a59bebafb99b;
    address[20] memory dragonDen;
    dragonDen[0] = 0xbc1ADfF2EAC8dbA22d382DFADDf7e6B73aBC2334;
    dragonDen[1] = 0x593Bc8EF18E35a3E3022412727c13768cB36da71;
    dragonDen[2] = 0x22673d0B02a1F741bCCA5D6B10aCd81A09dc0F00;
    dragonDen[3] = 0x0CC9E059BFf58a6bBe4b34c81e7f3416Af91091a;
    dragonDen[4] = 0x0778527E33A3e84585da51E18d66440d55fc9497;
    dragonDen[5] = 0x5735BA41852f309dF11aF2C27F9c49696eBE66B1;
    dragonDen[6] = 0x1F37B8205eF983Ef6FA548f9cFE06C194C90E01c;
    dragonDen[7] = 0x68e7A057e3B7B62ad2B600313FDb57B347daB87E;
    dragonDen[8] = 0x72186A1d8c9818A508729a29D56a8fd0899273Da;
    dragonDen[9] = 0x0BD796De8Aa0590Fe1E9485817B8E3cF396D4746;
    dragonDen[10] = 0x80296265888ba4EEBc563C6d23E45453e3c7E50B;
    dragonDen[11] = 0xE7235D153f3F1ddD6119170f15b5F4ed23FcbB34;
    dragonDen[12] = 0xC150A72A6Dd1C503466CA72aB4fb085235f49bA1;
    dragonDen[13] = 0x9163bdc17D19cBFe1F3e7058805bAC7D2b36E97f;
    dragonDen[14] = 0x54b47027085E3615222804bE4E6B699578bDBb88;
    dragonDen[15] = 0x5e81186632949fea3330737eB6f5a1BF8D24B1D4;
    dragonDen[16] = 0x177024f3c58f4eC6F5dae44C87518f690958aa91;
    dragonDen[17] = 0xbCE112E4338D632DE1a99eF57279BA8415639CA3;
    dragonDen[18] = 0x8e1fD988F2e0f18C9eC812b0C93A97931713D6f1;
    dragonDen[19] = 0xC77df1fe2aC97d983Cd2F2A988924bF11217b50a;
    uint8 r = random();
    return new Dragon(owner[r], dragonDen[r]);
  }

  function validateInstance(address _instance, address _player) public returns (bool) {
    _player;
    Dragon instance = Dragon(_instance);
    return instance.complete();
  }

  function random() public returns(uint8) {
    return uint8(uint256(keccak256(block.timestamp, block.difficulty))%20);
  }

}
