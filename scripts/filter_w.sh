#!/bin/bash

#Script used to process intermediate enumerated extreme rays after stopping the second vertex enumuration using mplrs. Output is a txt file with modes that have support on MW

CONVERSIONS="$1"

# Output filename: remove last 4 chars (e.g. .csv) and append suffix
OUT="${CONVERSIONS::-4}_supp_w.txt"

# Print the header name of interest (optional check)
head -1 "$CONVERSIONS" | tr ',' '\n' | grep -n "^M_MW$"

# Count nonzero entries in column M_MW
awk -F',' '
NR==1 {
    for(i=1;i<=NF;i++) {
        if($i=="M_MW") col_idx=i
    }
    if(!col_idx) {
        print "Column M_MW not found"; exit 1
    }
    next
}
$col_idx!=0 {count++}
END {
    print "Nonzero in M_MW column:", count
}' "$CONVERSIONS"

# Extract rows where M_MW != 0 and print supports (excluding that column)
awk -F',' '
NR==1 {
    for(i=1;i<=NF;i++) {
        col[i]=$i
        if($i=="M_MW") col_idx=i
    }
    if(!col_idx) {
        print "Column M_MW not found"; exit 1
    }
    next
}
$col_idx!=0 {
    printf "Row %d: ", NR-1
    for(i=1;i<=NF;i++) {
        if(i!=col_idx && $i!=0)
            printf "%s ", col[i]
    }
    print ""
}' "$CONVERSIONS" > "$OUT"
