# Advent of Code – Ruby

These are my Advent of Code solutions in Ruby.

The included CLI utility is based on [AoC-rb](https://github.com/Keirua/aoc-cli), with some additions. These are the commands:

- `aoc bootstrap YEAR DAY`: downloads the input and instructions files, and creates a source file and a spec file for the given day.
- `aoc run YEAR DAY [PART]`: runs part `1` or `2` of the given day, or both parts if neither is specified.
- `aoc submit YEAR DAY PART`: runs part `1` or `2` of the given day and submits the resulting answer.
- `aoc others YEAR DAY PART`: downloads and shows other people's solutions, from these repos:
  - <https://github.com/eregon/adventofcode>
  - <https://github.com/gchan/advent-of-code-ruby>
  - <https://github.com/ahorner/advent-of-code>
  - <https://github.com/ZogStriP/adventofcode>
  - <https://github.com/erikw/advent-of-code-solutions>

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
