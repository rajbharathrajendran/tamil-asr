KALDI_ROOT='/home/rb/Documents/ICT/speech_recognition/kaldi-trunk';
PATH=$PATH:'/home/rb/Documents/ICT/speech_recognition/kaldi-trunk/src/lmbin'
lm_order=1

# Preparing language data
utils/prepare_lang.sh data/local/dict "<UNK>" data/local/lang data/lang

echo "===== MAKING lm.arpa ====="
echo

loc=`which ngram-count`;
if [ -z $loc ]; then
     if uname -a | grep 64 >/dev/null; then
        sdir=$KALDI_ROOT/tools/srilm/bin/i686-m64 
    else
            sdir=$KALDI_ROOT/tools/srilm/bin/i686
      fi
      if [ -f $sdir/ngram-count ]; then
            echo "Using SRILM language modelling tool from $sdir"
            export PATH=$PATH:$sdir
      else
            echo "SRILM toolkit is probably not installed.
              Instructions: tools/install_srilm.sh"
            exit 1
      fi
fi

local=data/local
ngram-count -order $lm_order -write-vocab $local/tmp/vocab-full.txt -wbdiscount -text $local/corpus.txt -lm $local/tmp/lm.arpa

echo
echo "===== MAKING G.fst ====="
echo

lang=data/lang
cat $local/tmp/lm.arpa | arpa2fst - | fstprint | utils/eps2disambig.pl | utils/s2eps.pl | fstcompile --isymbols=$lang/words.txt --osymbols=$lang/words.txt --keep_isymbols=false --keep_osymbols=false | fstrmepsilon | fstarcsort --sort_type=ilabel > $lang/G.fst
