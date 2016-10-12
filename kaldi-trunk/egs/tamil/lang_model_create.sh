train_cmd="run.pl"
decode_cmd="run.pl"
tmpdir="data/local/tmp"

echo "***********Create G.txt**************************"
local/make_rm_lm.pl data/train/wp_gram.txt  > $tmpdir/G.txt

echo "***********Create G.fst**************************"
fstcompile --isymbols=data/lang/words.txt --osymbols=data/lang/words.txt --keep_isymbols=false \
    --keep_osymbols=false $tmpdir/G.txt > data/lang/G.fst

echo "***********Sort G.fst based on ilabel**************************"
fstarcsort --sort_type=ilabel data/lang/G.fst data/lang/G.fst