train_cmd="run.pl"
decode_cmd="run.pl"

echo "***********Create training feats.scp**************************"
steps/make_mfcc.sh --nj 10 --cmd "$train_cmd" data/train exp/make_mfcc/train $mfccdir

echo "***********Create training cmvn.scp**************************"
steps/compute_cmvn_stats.sh data/train exp/make_mfcc/train $mfccdir

echo "***********validating training data**************************"
utils/validate_data_dir.sh data/train

echo "***********Create testing feats.scp**************************"
steps/make_mfcc.sh --nj 7 --cmd "$train_cmd" data/test exp/make_mfcc/test $mfccdir

echo "***********Create testing cmvn.scp**************************"
steps/compute_cmvn_stats.sh data/test exp/make_mfcc/test $mfccdir

echo "***********validating testing data**************************"
utils/validate_data_dir.sh data/test