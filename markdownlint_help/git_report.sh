#!/usr/bin/bash

# name:    git_report.sh
# author:  nbehrnd@yahoo.com
# license: nil, pro uso interno
# date:    [2022-12-12 Mon]
# edit:

# Why:
# Preparation of the file `copyright` with `gem2deb` of `markdownlint` yields an
# incomplete list of contributors/holders of copyright.  So there is a need to
# retrieve everyone, however in a programmatic manner.  Because there is no
# opposition to my question to the mailing list[1] if stating the first year of
# a contributor's contribution would suffice, commit archeology is required.
#
# How to:
# Copy-paste of this bash script into a local git repository of markdownlint.
# With
#
# ```shell
# bash ./git_report.sh > listing.txt
# ```
# there will be a simplified permanent record with entries in pattern of
#
# ```
# 1864 Henri Dunant <henri@example01.org>
# 1888 John Dunlop <john@example02.com>
# ```
#
# where the list is sort in chronological ascending order.  This intentionally
# reverses the "geological sort" with the most recent entry on top.  It works
# well enough with bash, git, and sed as provided by Debian 12/bookworm.
#
# Next step:
# Authors committing in multiple years still may appear multiple times.  Script
# `simpler_list.py` addresses this; to be used after this script.
#
# [1] https://lists.debian.org/debian-ruby/2022/12/msg00010.html, deposit on
# [2022-12-09 Fri], checked again today, on [2022-12-12 Mon] -- no reply.

git log --reverse --pretty='format: %ad %an <%ae>' | \
    sed -e 's/.\{9\}[0-9]\+.\{10\}//' | \
    sed -e 's/[\+-][0-9]\{4\} //' | uniq
