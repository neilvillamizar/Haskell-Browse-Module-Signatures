# Haskell-Browse-Module-Signatures

A simple Haskell script to get the functions signatures from a user defined module in a Haskell source file.

## Script to get the functions names and types from an user defined module

This script can get the functions names and types from an user defined module. It uses the Hint package, a wrapper of the GHC API, to load and export the given module. To install Hint, you could use:

```
cabal install --lib hint
```

### To Compile:

```
ghc get_functions.hs -o get_functions
```

### To Run:

```
./get_functions
```

The program will ask you to enter the module name. You could test it with 'Functions' module from the Functions.hs file.