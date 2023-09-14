import json
import string
import nltk
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
	question = question.lower()

	question = question.replace('**', '')
	question = question.replace('?', '')
	question = question.replace('¿', '')
	question = question.replace('"', '')

	question = question.replace('á', 'a')
	question = question.replace('ó', 'o')
	question = question.replace('í', 'i')
	question = question.replace('é', 'e')
	question = question.replace('ú', 'u')
	question = question.replace(',', '')
	question = question.replace('  ', ' ')

	for answer in question_data:
		data = cosine_sim(answer['question'], question)
		
		if data > 0.65:
			print(f'[response.debug] {question} > {answer["question"]} (probability: {data})')
			return answer['answer']

	return None