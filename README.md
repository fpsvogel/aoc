# aoc

CLI tool for doing Advent of Code in Ruby.

## Installation

This gem isn't published yet, so for now you can install it by running these commands:

```
git clone https://github.com/fpsvogel/aoc.git
cd aoc
rake install
```

## Usage

1. Create a directory where you want to store your solutions.
2. In that directory, run the command `aoc` and follow the prompts!

## Commands

Okay, if you *really* want to know all the details, here they are.

Note: all commands can be abbreviated with their first letter, e.g. `aoc b` for `aoc bootstrap`.

- `aoc bootstrap [YEAR] [DAY]`
  - Commits new and modified solutions to Git.
  - Downloads the input and instructions files for the given day.
  - Creates a source file and a spec file for the given day.
  - Downloads other people's solutions, from these repos:
    - <https://github.com/eregon/adventofcode>
    - <https://github.com/gchan/advent-of-code-ruby>
    - <https://github.com/ahorner/advent-of-code>
    - <https://github.com/ZogStriP/adventofcode>
    - <https://github.com/erikw/advent-of-code-solutions>
  - *If both arguments are omitted, it bootstraps the next puzzle, i.e. the puzzle after the one that was last committed to Git.*
  - *If only the day argument is omitted, it bootstraps the next puzzle of the given year.*
  - Opens all of the new files using `editor_command` in `config.yml`.
  - Note: For easy file-searchability (Ctrl+P in VS Code), the instructions file is named (for day 1 of 2015, for example) `1501.md` and the other solutions are named `15011.rb` and `15012.rb` (part 1 and part 2).
- `aoc run [YEAR] [DAY]`
  - Runs specs for the given day.
  - Unless specs fail, runs the currently in-progress part (Part One or Part Two) of the given day.
  - If you're seeing specs run when you want to run only the real input, or vice versa, add one of the following flags:
    - `--spec` (`-s`) runs only the specs. (To run only Part One or Part Two specs, in the spec file change `it` to `xit` on the other one to skip it.)
    - `--real_part_1` (`-o`) runs only Part One with the real input.
    - `--real_part_2` (`-t`) runs only Part Two with the real input.
  - Optionally submits the answer, via a prompt that appears if it has not already been submitted.
  - *If both arguments are omitted, it runs the puzzle that is untracked in Git, if any.*
- `aoc git` commits new and modified solutions to Git. This is handy if (unlike the basic "solve and then run `aoc bootstrap`" flow) you like to make multiple commits per solution, e.g. one after your own solution and then another after improving it based on other people's solutions.
- `aoc progress` shows progress (total and by year) based on the number of your solutions committed in Git.
- `aoc config` opens the config YAML file.
- `aoc help` shows a summary of each command.

## Other AoC Ruby CLI tools

This gem was originally based on [AoC-rb](https://github.com/Keirua/aoc-cli). Here are other similar tools:

- [AocRb](https://github.com/pacso/aoc_rb)
- [aoc-cli](https://github.com/apexatoll/aoc-cli)
- [aocli](https://github.com/astley92/aocli)
- [advent_of_code_cli](https://github.com/egiurleo/advent_of_code_cli)
- [advent_of_code_generator](https://github.com/Tyflomate/advent_of_code_generator)
