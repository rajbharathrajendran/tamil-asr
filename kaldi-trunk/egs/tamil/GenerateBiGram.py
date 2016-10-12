import sys
import codecs


corpus = "data/train/corpus"
wp_gram = "data/train/wp_gram.txt"

inputf = codecs.open(corpus, "r", "utf-8")
outputf = codecs.open(wp_gram, "w", "utf-8")
corpus = inputf.read()
dict = {}
sortedkey = sorted(set(corpus.split()))
for line  in corpus.split("\n"):
	wordarr = line.split() 
	wordarr.append("SENTENCE_END")
	for index in range(0,len(wordarr)-1):
		if wordarr[index] not in dict.keys():
			dict[wordarr[index]] = [wordarr[index+1]]	
		else:		
			templist = dict[wordarr[index]]
			templist.append(wordarr[index+1])
			dict[wordarr[index]] = templist
for key in sortedkey:
	outputf.write("\n>"+key+"\n")
	outputf.write("\n".join(sorted(set(dict[key]))))
outputf.close()
