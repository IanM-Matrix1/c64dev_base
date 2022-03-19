# c64dev_base

## A simple BASIC/assembly build processor.

Contains:
- A Makefile that understand BASIC & assembly compilation
    - Uses kickassembler for assembly language compilation (provided)
    - Uses the VICE petcat utility for BASIC compilation (?!)
    - Used the VICE c1541 utility to build disk images
- A very simply BASIC preprocessor (more of a filter really) written in perl
- A very simply example that combines BASIC and assembly code

## The BASIC preprocessor

- Empty lines are discarded
- Lines starting with a single quote are treated as a comment and are discarded
- Lines starting with #include are used to pull files into the current source file
    - You can include BASIC source code
    - You can include kickass's symbol files (\*.sym) to import the symbols as constants
- Lines starting with #const are used to define substitution variables that can be used with other #const directives or in BASIC code
- Lines starting with a digit are BASIC code lines
    - Duplicate line numbers are errors
- Substitutions take place only on BASIC lines and the values for #const.
    - The values must be defined before use

## Requirements

- java runtime environment (for kickass)
- perl 5.30+ (for basic\_preproc)
- make (for the Makefile)
- VICE (for the petcat and c1541 utilities)
