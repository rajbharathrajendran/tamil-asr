#!/usr/bin/env python
# -*- coding: utf-8 -*-

from txt2ipa.ipaconvert import ipa, broad
from txt2ipa.transliteration import tam2lat

with open("data/train/corpus","w") as f1:
	with open("EntireCorpus.txt") as f2:
		s = f2.read()
		with open("to_remove.txt") as f3:
			for word in f3.readlines():
				print word.strip()
				s = s.replace(word.strip(),'')
		f1.write(s)

# text = 'வணக்கம் தமிழகம்'


# t1 = tam2lat(text)
# t2 = " " + t1 + " "
# t2 = ipa(t2)
# t3 = broad(t2)
# print "after tam2lat", t1
# print "after ipa", t2
# print "after broad", t3

