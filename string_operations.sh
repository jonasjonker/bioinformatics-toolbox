#!/bin/bash
#
# Blueprint for common string operations using awk, grep and sed.
#
# Use grep for pattern searching.
# For simple string replacement, use sed.
# grep | sed pipelines combine well.
#
# For more complex tasks use awk (or a scripting language). Sed regex has 
# limited capabilities. 

################################################################################
# Read a file line by line
#   while read line; do
#     echo $line
#   done < $OUTFILE
#
# Write to a file
#   "some text" > $OUTFILE
#
# Append to a file
#   "some text" >> $OUTFILE
################################################################################

SEQ="AACCGGTTACGTAHELLOTCCCCTHELLOGGATCGATTAGGGGAAHELLOTGCATGACTGACC"

TAB_SEP=$'Sepal length	Sepal width	Petal length	Petal width	Species\n
5.1	3.5	1.4	0.2	I. setosa\n
4.9	3.0	1.4	0.2	I. Setosa\n
4.7	3.2	1.3	0.2	I. arctica\n
4.6	3.1	1.5	0.2	I. arctica\n
5.0	3.6	1.4	0.2	I. setosa'

################################################################################
# Basic awk examples:
# Awk can do much more then demonsrated here. But maybe you shouldn't :)
#
# for more help see: man awk
#
# Awk command structure:
#   awk BEGIN { <action> } <condition> { <action> } BEGIN { <action> } [FILE]
# both the BEGIN and END statements are optional. The 'middle bit' is repeated
# for every line in the FILE(s) specified.
#
# build-in variables
#   FS       - field separator
#   OFS      - output field separator
#   RS       - record/line separator
#   ORS      - output record/line separator
#   NR       - number of records / record number
#   NF       - number of field / field number
#   FILENAME - filename
################################################################################
awk_exampes() {
  echo "awk"
  header=$(echo "$TAB_SEP" | awk 'NR==1{print}')
  count=$(echo "$TAB_SEP" | awk '/s.{3}sa/ {count++} END {print count}')
  selection=$(echo "$TAB_SEP" | awk '$0 ~ "I. arctica" {print}')
  substitute=$(echo "$TAB_SEP"  | awk '{gsub(/arctica/,"setosa");print}')
  COLON_SEP=$(echo "$substitute" | awk 'BEGIN {OFS=":"} {$1=$1; print}')

  echo "$TAB_SEP"
  echo "$header"
  echo "$selection"
  echo "number of setosa's: $count"
  echo "$COLON_SEP"
}

################################################################################
# Basic sed examples:
# Note that sed regex doesn't have all functionality that is found in grep or
# Python regex. for example [^ACGT]+ matches any ONE non ACGT character multiple
# times, but not combinations of different characters.
#
# for more check 'man sed'
#
# sed command structure:
#   sed s/<regex pattern>/<replacement>/<option>
#
# common options:
#   s///g   - replace all
#   s///2   - replace at index
#   s///I   - case insensitive
################################################################################
sed_exampes() {
  echo $(echo "$SEQ" | sed 's/HELLO//')
  echo $(echo "$SEQ" | sed 's/[^ACGT]+//')
  echo $(echo "$SEQ" | sed 's/[^ACGT][^ACGT][^ACGT][^ACGT][^ACGT]//')
  echo $(echo "$SEQ" | sed 's/HELLO/...../g')
  echo $(echo "$SEQ" | sed 's/HELLO/...../2')
  echo $(echo "$SEQ" | sed 's/HELLO/...../2g')
  echo $(echo "$SEQ" | sed 's/HELLO/...../g2')
  echo $(echo "$SEQ" | sed 's/hello/...../g I')
}

################################################################################
# Basic grep examples:
#
# for more check 'man grep'
#
# grep command structure:
#   grep <option(s)> <pattern(s)> <file(s)>
#
# common options
#   -c count
#   -e regex
#   -E extended regex
#   -P Perl regex
#   -i case insensitive
#   -o only show pattern
#   -l only show file
#   -r recursive
#   -v invert
################################################################################
grep_exampes() {
  echo $(echo "$TAB_SEP" | grep "setosa")
  echo $(echo "$TAB_SEP" | grep -c "setosa")
  echo $(echo "$TAB_SEP" | grep -v "setosa")
  echo $(echo "$TAB_SEP" | grep -I "setosa")
  echo $(echo "$TAB_SEP" | grep -l "setosa")
  echo $(echo "$TAB_SEP" | grep -e "s[eto]{3}sa")
  echo $(echo "$TAB_SEP" | grep -E "s[eto]{3}sa")
  echo $(echo "$TAB_SEP" | egrep "s[eto]{3}sa")
  echo $(echo "$TAB_SEP" | grep -Eo "s[eto]{3}sa")
  echo $(echo "$TAB_SEP" | grep -Po "(?<=se)to(?=sa)")
}
