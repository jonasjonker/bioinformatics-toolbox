#!/bin/bash

# execute a script like this:
# bash my_script.sh [options]

# or make it executable from anywhere by changing its persmisions:
# chown 777  my_script.sh

# and then adding this line to ~/.bashrc:
# export PATH=$PATH:/my/scripts/dir/

# this bit parses command line arguments --------------------------------------

usage() {
    echo "Usage: $programname [-hipm] ... INFILE... OUTFILE"
    echo "Do a thing with INFILE(s) and safe result to OUTFILE"
    echo ""
    echo "These options are recognized by this script:"
    echo "  -h              display this help message"
    echo "  -i              echo user input"
    echo "  -p              display: ping"
    echo "  -m message      display specified message"
    exit 1
}

# getopts in short
# 'getopts "fo:"' parses specified flags as either
#   - a flag "f"
#   - a flag "o" followed by a one or more parameters ":"
#
# use 'man test' for more help on getopts
while getopts "hipm:" opt; do
    case $opt in
        i)
          echo "Type something you want echoed. Press Ctrl+D to end echo mode"
          while read; do echo "$REPLY"; done   # read stores in REPLY by default
          ;;
        p)  echo "ping"
            ;;          # end of case operator
        m)
            echo "$OPTARG"
            ;;
        h|*)
            usage
            ;;
    esac
done

# removes optional arguments from parameter list
shift $((OPTIND-1))

# check number of arguments. Use 'man test' for info on arithmic operators.
if [ "$#" -lt 2 ]; then
    echo "At least one INFILE and one OUTFILE required"
    usage
    exit 1
fi

# loop over all parameters. Use 'man test' for info on more file tests.
for i in $@; do
    if [ -f $i ]; then
        echo $i "is a file."
    elif [ -d $i ]; then
        echo $i "is a directory."
    else
        echo $i "is neither a file nor a directory."
    fi
done

# string comparison uses different operators than integer comparison
OUTFILE=${@: -1}
echo "OUTFILE: $OUTFILE"
for var in "$@"; do
    if [ $var != $OUTFILE ]; then
       echo "INFILE: $var"
    fi
done

# Here the actual code starts --------------------------------------------------

echo "(over)write a file" > $OUTFILE
echo "Appended a file" >> $OUTFILE

while read line; do
  echo $line
done < $OUTFILE      # read a file

# fasta
echo ">NM_012444.3 Homo sapiens SPO11 initiator of meiotic double stranded breaks (SPO11), transcript variant 1, mRNA" > $OUTFILE
echo "AGCCACGCCCCAAGGGCGCAGCCTAGGACAGGGGCTTCTGGAGCTTCTGGCAGCCGTCTGCCCTCATGGC
CTTTGCACCTATGGGGCCCGAGGCCTCGTTCTTCGACGTTTTGGACCGACACAGGGAGTCCCTGCTGGCT
GCCCTGAGGAGAGGTGGCAGGGAGCCCCCAACTGGGGGAAGCCGCCTGGCCTCCAGTTCTGAGGTTCTTG
CATCTATAGAAAATATTATCCAAGACATAATCACAAGCTTGGCAAGAAATGAAGCACCTGCATTCACGAT
AGACAACAGATCAAGCTGGGAAAACATAAAGTTTGAAGATTCTGTGGGTCTTCAGATGGTATCCCATTGC
ACCACCAGAAAGATCAAAAGTGATTCACCAAAATCAGCTCAAAAATTTTCTCTAATCCTTAAAATATTGT
CCATGATTTATAAATTAGTACAGAGCAACACTTATGCAACCAAAAGGGACATATATTACACTGACAGTCA
ACTCTTTGGTAACCAGACTGTCGTCGACAATATTATCAATGACATTTCTTGCATGTTAAAAGTGTCAAGG
AGGAGTCTACATATATTATCTACATCAAAAGGTTTAATTGCTGGCAACTTAAGATACATCGAGGAAGATG
GCACCAAAGTGAATTGTACCTGTGGTGCAACGGCTGTTGCTGTGCCATCGAATATTCAAGGAATTCGGAA
TTTAGTTACAGATGCAAAGTTTGTATTAATTGTAGAAAAAGATGCAACATTTCAGCGGCTCCTAGATGAC
AACTTTTGCAACAAATTGTCTCCTTGCATCATGATTACGGGAAAGGGAGTTCCTGATCTAAACACAAGAC
TTTTAGTCAAGAAACTGTGGGATACATTTCATGTTCCTGTTTTCACTCTTGTAGATGCTGATCCACATGG
CATAGAAATAATGTGCATCTATAAGTATGGATCTATGTCTATGTCTTTTGAAGCTCATCATCTCACAGTT
CCAGCTATTAGATGGCTTGGTCTTCTCCCTTCTGATCTTAAAAGATTAAATGTACCTAAAGATAGTTTGA
TTCCACTGACAAAAAGGGACCAAATGAAACTTGACAGTATCCTGAGGAGACCTTATGTTACCTGCCAACC
ATTTTGGAGAAAAGAAATGGAAATAATGGCAGACTCTAAAATGAAGGCAGAAATTCAAGCTTTGACTTTC
CTATCATCAGATTATCTTTCCAGAGTGTACTTACCTAACAAATTAAAATTTGGAGGATGGATATAAAAAT
AAATCAGAAGAACTTCTGATTGCCAGAGGCTTTTCATTAGTTTTGTTTTGATTGGCAAATACTATTGTGG
AAAGAACATATATTATATTCTTAATTCTGTAAAAGTGAAATAAAATAACTTTCCGTTAATTATATATTTT
TGTCAAAACAAATGCTGTACTCCAATTTTCTTTGCAAGGCCTTATTCTTGCCTCTATAGAGACAGATTTC
TGTCCTATCTTCTAAAGCAAATTATAAAAGAATATGTTATTTTGACCTTTAAATTATTTTTGAAAAAATA
ATATTTTATACATGTCATCAAAGTCTACAAAATATTTACCTTCTACGATACAACTAATGTTAACGCATAA
AGTATCTTACTGGTAACAAAAATCATAATGATCTGAATTTGAGATGTTGCAAATGAATTGTGGTGTCCGG
TAGTTTCTTCTTACATTTTCCTTTGCCTTTATACTTTAGGGGTCTTACTCCATTAATTCATTTGTTACAT
TAGTAAAATTCAGTATGAATAAATATTTGGATTGATGTA" >> $OUTFILE

# the commands within $(...) are executed as if they are typed when echoed.

# awk build-in variables
# FS  - field separator
# OFS - output field separator
# RS  - record/line separator
# ORS - output record/line separator
# NR  - number of records / record number
# NF  - number of field / field number
# FILENAME - filename

# awk command structure
# optional head
#     BEGIN {<action>}
# do for every record
#     <condition>{action}
# optional finish
#     END   {<action>}
echo $(awk "NR==1{print}" $OUTFILE) # print first record

DATA="""1):Amit:Physics:80
2):Rahul:Maths:90
3):Shyam:Biology:87
4):Kedar:English:85
5):Hari:History:89"""

# you can change in-/output field and record separators.
# note that awk only changes the formating if you modify a file. If you don't
# want to change a file use {$1=$1} to replace a field with itself.
b=$(echo $DATA | awk 'BEGIN { FS=":"; RS=" ";OFS=" "}{$1=$1} /[0-9]+/ {print}')
echo "$b"

# check if ANY row contians regex, replace it with string.
c=$(echo $DATA | awk '$0 ~ /ahu/ {gsub(/ahu/,"aou", $2);print}')
echo "$c"

# count records with GGGG in it.
echo $(awk " /[G]{4}/ {count++} END {print count}" $OUTFILE)

# sed works in the following way
# s/<regex pattern>/<replacement>/<option>
# s///g : replace all
# s///2 : replace at index
# s///I : case insensitive
# for more check 'man sed'
echo $(echo "hellohelloHelloworld!" | sed 's/hello//')      # remove first occurence
echo $(echo "hellohelloHelloworld!" | sed 's/hello/hoi/g')  # change all occurences of hello to hoi
echo $(echo "hellohelloHelloworld!" | sed 's/hello/hoi/2g') # change all occurences of hello after 1 to hoi
echo $(echo "hellohelloHelloworld!" | sed 's/hello/hoi/2')  # changes only second occurence
echo $(echo "hellohelloHelloworld!" | sed 's/hello/hoi/g I') # ingnore case
echo $(echo "hellohelloHelloworld!" | sed 's/[el]*//g' | sed 's/hoho/Hoho/g')


echo $(grep -E '(=?CG)[GC]{3,}[AT]{2}' | sed 's/[GC]{3}[AT]{2}/oooooo/' $OUTFILE)
grep -lE "" | xargs
