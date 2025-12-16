#!/usr/bin/bash

# name:    git_report.sh
# author:  nbehrnd@yahoo.com
# license: MIT
# date:    [2022-12-12 Mon]
# edit:    [2023-01-21 Sat]

# Why:
# The preparation of file `copyright` with `gem2deb` about `markdownlint` only
# states Mark Harrison as copyright holder.  This omits subsequent contributors;
# between [2014-05-31 Sat] and [2022-12-15 Thu], 353 commits by 52 contributors
# were merged.  There is a perceived need to report everyone from the git log,
# though automated.  Pending a reply to my question to the mailing list,[1] the
# eventual pattern will report name, address, and year of of first contribution.
#
# This script is the first of two assistants written to ease packaging for
# Debian (the other 'simpler_list.py', see there).  The present shell script
# only retrieves the relevant data from git, and performs a first round of data
# cleaning.
#
# How to:
# Copy-paste of this bash script into a local git repository of `markdownlint`.
# With
#
# ```shell
# bash ./git_report.sh > listing.txt
# ```
# 
# there will be a permanent record with entries in pattern of
#
# ```
# 1864 Henri Dunant <henri@example01.org>
# 1888 John Dunlop <john@example02.com>
# ```
#
# with entries sort in chronological ascending order.  This script intentionally
# reverses the "geological sort" with the most recent entry on top usually seen.
# The script was written for and tested with `bash` (GNU bash version 5.2.15),
# `git` (2.39.0), and `sed` (4.9) as shipped with Linux Debina 12/bookworm.
#
# The subsequent step:
# Authors committing in multiple years still appear multiple times in the record
# written.  See script `simpler_list.py` to address this issue.
#
# [1] https://lists.debian.org/debian-ruby/2022/12/msg00010.html, sent on
# [2022-12-09 Fri].

#git log --reverse --pretty='format: %ad %an <%ae>' | \
#    sed -e 's/.\{9\}[0-9]\+.\{10\}//' | \
#    sed -e 's/[\+-][0-9]\{4\} //' | uniq

# The longlist reports the contributor's first commit in the format of
#
# <YYYY> <author's name> <author's email>
#
# The output is used for file `debian/copyright`.  The deduplication by
# AWK is a pattern by presented by Sundeep Agarwal,
# <https://learnbyexample.github.io/learn_gnuawk/dealing-with-duplicates.html>
git log --reverse --pretty='format:%as %an <%ae>' | \
cut -c1-4,11- | \
awk '!seen[$NF]++ {print $0}' > longlist.txt && \
echo "Longlist for debian/copyright was written to file longlist.txt."

# The shortlist reports the contributors by their names known to GitHub
# in sequence of their first commit to markdownlint.  The result is used
# in file debian/markdownlint.1, the linter's man page.
git log --reverse --pretty='format: %an' | \
awk '!seen[$NF]++ {printf ("%s,", $0)}' | \
fold -s -w 72 > shortlist.txt &&
sed -i 's/^[ ]//' shortlist.txt && \
sed -i 's/[ \t]*$//' shortlist.txt && \
echo "Shortlist for man page file was written to file shortlist.txt."

