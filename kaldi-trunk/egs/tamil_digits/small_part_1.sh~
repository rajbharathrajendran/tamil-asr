KALDI_ROOT='/home/rb/Documents/ICT/speech_recognition/kaldi-trunk';
lm_order=1
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

