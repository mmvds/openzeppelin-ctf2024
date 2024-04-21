# **Alien Spaceship**
1) Used [Dedaub decompiler](https://app.dedaub.com/decompile?md5=60cad9a4c1fe82b05f6591dcceb5ecdb) to get a first version of initial contract

2) Replaced 4bytes with human-readable selectors via [selectors converter](https://www.4byte.directory/)

3) Solution
Used `--slow` key to bypass pauses
`forge script ./script/Solution.s.sol:Solution --rpc-url $RPC_URL --private-key $PRIVATE_KEY -vvvvv --broadcast --skip-simulation --slow`