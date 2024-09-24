# Advent of Code – Ruby

These are my Advent of Code solutions in Ruby.

The included CLI utility is based on [AoC-rb](https://github.com/Keirua/aoc-cli), with some additions. These are the commands:

- `aoc bootstrap YEAR DAY`
  - Downloads the input and instructions files for the given day.
  - Creates a source file and a spec file for the given day.
  - Downloads other people's solutions, from these repos:
    - <https://github.com/eregon/adventofcode>
    - <https://github.com/gchan/advent-of-code-ruby>
    - <https://github.com/ahorner/advent-of-code>
    - <https://github.com/ZogStriP/adventofcode>
    - <https://github.com/erikw/advent-of-code-solutions>
  - *If no arguments are given, it tries to bootstrap the puzzle that comes after the one that was last committed to Git.*
  - Opens all of the new files using `editor_command` in `config.yml`.
  - Note: For easy file-searchability (Ctrl+P in VS Code), the instructions file is named (for day 1 of 2015, for example) `1501.md` and the other solutions are named `15011.rb` and `15012.rb` (part 1 and part 2).
- `aoc run YEAR DAY [PART]`
  - Runs part `1` or `2` of the given day. If the `PART` argument is omitted, it is inferred from the part(s) already solved.
  - Optionally submits the answer, via a prompt that appears if it has not already been submitted.
  - *If no arguments are given, it runs the puzzle that is untracked in Git, if any.*

## Installation

 - Clone this repo.
 - Run `bundle install`.
 - Delete the `solutions` directory if you want to write your own solutions rather than look at mine.
 - Change the `editor_command` in `config.yml` if you use an editor other than VS Code.
 - Log in to [Advent of Code](https://adventofcode.com/), and copy your session cookie.
   - Firefox: Developer Tools ⇨ Storage tab ⇨ Cookies
   - Chrome: Developer Tools ⇨ Application tab ⇨ Cookies
 - Rename the file `.env.example` to `.env`.
 - Paste the cookie into the `AOC_COOKIE` variable. The `.env` file should look like this:
```
AOC_COOKIE="536…"
```

You're done! You can now start working on your first puzzle by running the `aoc bootstrap` command, e.g. for Day 1 of 2023: `aoc bootstrap 2023 1` or (for short) `aoc b 23 1`.

## For the curious: other AoC Ruby CLI tools

- [AocRb](https://github.com/pacso/aoc_rb)
- [aoc-cli](https://github.com/apexatoll/aoc-cli)
