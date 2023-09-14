import nltk
from nltk.corpus import stopwords
import pandas as pd
import re
import numpy as np
from sklearn.linear_model import LogisticRegression

nltk.download('punkt')
nltk.download('stopwords')
stop_words = set(stopwords.words('spanish')) 

def clean_word(text):
    result = " ".join(re.sub("([^0-9A-Za-z \t])|(\w+:\/\/\S+)", "", text).split())
    result = re.sub(r'[^a-zA-Z0-9\s]', '', result)
    return result

def get_words(messageList, inSet = True):
    words_in_message = [message.lower().split() for message in messageList]
    if inSet:
        words_in_message = set([clean_word(item) for element in words_in_message for item in element])
    else:
        words_in_message = [item for element in words_in_message for item in element]
  
    words_in_message = [w for w in words_in_message if not w in stop_words] 
    return words_in_message

def get_frecuencies(messageList, vocabulary):
    words_in_message = get_words(messageList, False)
    frecuencies = []
    
    for i in vocabulary:
        frecuencies.append(words_in_message.count(i))
    
    return np.array(frecuencies)

def get_frecuency_table(positive_msg, negative_msg):
    all_messages = positive_msg + negative_msg
    all_words = list(get_words(all_messages))

    positive_frecuencies = get_frecuencies(positive_msg, all_words)
    negative_frecuencies = get_frecuencies(negative_msg, all_words)

    return pd.DataFrame(list(zip(all_words, positive_frecuencies, negative_frecuencies)), columns = ['words', 'pos_frec', 'neg_frec'])

def encode_message(frecuency_table, message):
    words = get_words([message])
    pos_frec = 0
    neg_frec = 0

    for word in words:
        try:
            pos_frec = pos_frec + frecuency_table[frecuency_table['words'] == word]["pos_frec"].values[0]
            neg_frec = neg_frec + frecuency_table[frecuency_table['words'] == word]["neg_frec"].values[0]
        
        except:
            pass
    
    return [1, pos_frec, neg_frec]