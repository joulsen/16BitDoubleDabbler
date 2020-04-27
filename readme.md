# 16 Bit Double Dabbler VHDL module

## .. or just an integer to binary-coded decimal converter.

This VHDL module executes the [double dabble](https://en.wikipedia.org/wiki/Double_dabble) algorithm to turn a 16 bit unsigned integer into a [binary-coded decimal](https://en.wikipedia.org/wiki/Binary-coded_decimal). The output consists of a vector of 20 bits, where each subvector of 4 bits represent a decimal number (0-9). The module accepts every 16 bit input but always treats them as unsigned.