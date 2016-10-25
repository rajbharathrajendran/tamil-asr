# asr_tamil

##go to folder "kaldi-trunk/egs/tamil/"

###1) prepare acoustic_model_train.txt
	format:-
		utterence_id,speaker_id,text,audio_path
###2) prepare acoustic_model_test.txt
	format:-
		utterence_id,speaker_id,text,audio_path
###3) prepare spk2gen for train and test
	format:-
		speaker_id gender
###4) run prepare_acoustic_models.ipynb
###5) run data_prep.sh
###6) run prepare_language_model.ipynb
###7) lang_model_create.sh
###8) path.sh
###9) make_lm_arpa.sh
###10) mono_train_decode.sh
###11) try_train_decode.sh
###12) check exp/mono/decode/log/decode.1.log

####The decoded output can be found here
