import json
import nltk
import utils
import string
from nltk.corpus import stopwords
from sklearn.feature_extraction.text import TfidfVectorizer


with open('dataset/questions.nad') as json_file:
	question_data = json.load(json_file)


print(f'[response.debug] {len(question_data)} items loaded')


stop_words = set(stopwords.words('spanish')) 


stemmer = nltk.stem.porter.PorterStemmer()
remove_punctuation_map = dict((ord(char), None) for char in string.punctuation)


def stem_tokens(tokens):
	return [stemmer.stem(item) for item in tokens]


def normalize(text):
	return stem_tokens(nltk.word_tokenize(text.lower().translate(remove_punctuation_map)))

vectorizer = TfidfVectorizer(tokenizer = normalize, stop_words = stop_words)


def cosine_sim(text1, text2):
	tfidf = vectorizer.fit_transform([text1, text2])
	return ((tfidf * tfidf.T).A)[0,1]


def get_response_for_question(question):
	question = utils.clean_text(question)
	possible_answers = []
	text = None

	for answer in question_data:
		data = cosine_sim(answer['question'], question)
		
		if data > 0.65:
			print(f'[response.debug] {question} > {answer["question"]} (probability: {data})')
			possible_answers.append([answer['answer'], data])
			text = answer['answer']

	print(possible_answers)

	return text

	#return None