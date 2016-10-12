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
###5) run prepare_language_model.ipynb
###6) lang_model_create.sh
###7) path.sh
###8) make_lm_arpa.sh
###9) mono_train_decode.sh
###10) try_train_decode.sh
###11) check exp/mono/decode/log/decode.1.log

####The decoded output can be found here
