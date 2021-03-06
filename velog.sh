mkdir -p data
cat $1 | perl -ne 'print if s/# Info: @(?<timestamp>[[:digit:]]+) ps [[:alnum:]_.]+\[(?<id>[[:digit:]]+)\][[:alnum:]_.]+\.(?<name>[[:alnum:]_]+) = 0x(?<value>[[:xdigit:]]+)/$+{id}."\t".$+{name}."\t".$+{timestamp}."\t".hex($+{value})/ge' | awk '!($1 in id){id[$1]; print $1,$2 > "index.txt"} {print $3,$4 > "data/"$1".txt"}'
