# syl20bnr theme

Sylvain Benner personal, compact (hmmm...) yet complete (almost :-)) oh-my-fish theme.

**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [Segments](#segments)
	- [pwd: Compact current working directory](#pwd-compact-current-working-directory)
		- [Examples](#examples)
	- [git](#git)
		- [Examples](#examples-1)
	- [vi-mode](#vi-mode)
	- [end](#end)
	- [where](#where)
- [Functions](#functions)
- [Mac compatibility](#mac-compatibility)
- [Cygwin compatibility](#cygwin-compatibility)

## Segments

### pwd: Compact current working directory

The `pwd` segment format is `X:P(N)` where:
- `X` is either `home` or `/`
- `P` is the current working path base name (name of the current directory)
- `N` is the depth of the path starting from `X`

If the `pwd` is `home` or `/` then the prompt format is simplified to `home`
and `/` respectively without the current directory and depth.

#### Examples

In home directory:
![home](http://raw2.github.com/syl20bnr/oh-my-fish-theme-syl20bnr/master/screenshots/prompt_fish-syl20bnr-home2.png)

Inside a directory in home:
![inside_home](http://raw2.github.com/syl20bnr/oh-my-fish-theme-syl20bnr/master/screenshots/prompt_fish-syl20bnr-inside-home.png)

Outside the home directory:
![outside_home](http://raw2.github.com/syl20bnr/oh-my-fish-theme-syl20bnr/master/screenshots/prompt_fish-syl20bnr-outside-home.png)

### git

If the current directory is a [git][git] repository then the `pwd` segment is
replaced by the `git` segment (I should know where I am).

The `git` segment format is `X:YI@Z:P(N)` where:
- `X` is `git`
- `Y` is the current branch name
- `I` is the information about the current repository state
- `Z` is the name of the repository
- `P` is the current working path basename (name of the current directory)
If `P` = `Z` then `P(N)` is not displayed
- `N` is the depth of the path starting from base directory of the repository

The displayed information `I` is:
- Dirtiness is indicated by a little dot after the branch name.
- Unpushed commits are indicated with up arrows
- The number of unpushed commits is indicated right after the up arrows


#### Examples

Dirty:
![dirty](http://raw2.github.com/syl20bnr/oh-my-fish-theme-syl20bnr/master/screenshots/prompt_fish-syl20bnr-git-dirty.png)

Unpushed commits:
![unpushed_commits](http://raw2.github.com/syl20bnr/oh-my-fish-theme-syl20bnr/master/screenshots/prompt_fish-syl20bnr-git-ucommit-count.png)

In a sub-directory of the repository:
![repo_subdir](http://raw2.github.com/syl20bnr/oh-my-fish-theme-syl20bnr/master/screenshots/prompt_fish-syl20bnr-git-subdir.png)

### vi-mode

This segment display the current `vi-mode` if the fish native vi mode or
the oh-my-fish vi-mode plugin is used.
See the `[n]` in the previous screenshots.

### end

The color of the end of the prompt depends on the `$status` value of the
last executed command. It is `green` or `red` depending on the success or
failure of the last command.

Since I often use [ranger][ranger] and its `shift+s` key binding to bring
a new child shell session, there is a discreet indicator when the parent
process of the current shell is a `ranger` process: the end of the prompt
is written twice (ie: `>>` instead of just `>`).
With this indicator I quickly see if I can `ctrl+d` to end the current shell
process and go back to the parent `ranger` process.

### where

The `where` segment format is `X@Y` where:
- `X` is the user name
- `Y` is the host name

This segment is displayed in the right prompt.

## Functions

Some functions come with the theme:
- `toggle_right_prompt` will... toggle the right prompt! (alias: `trp`)

## Mac compatibility

In order to make this theme work correctly with all the features make sure to
install the following packages via MacPorts or Homebrew:
-`pstree` (used in ranger detection)

## Cygwin compatibility

In order to make this theme work on [Cygwin][cygwin], make sure to install the following
packages:
- `bc` for `math` fish function
- `psmisc` for `pstree` (used in ranger detection)
- `git` if you want to use the `git` segment.

[git]: http://git-scm.com/
[ranger]: http://ranger.nongnu.org/
[cygwin]: http://cygwin.com/
