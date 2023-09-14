from nlp import *
from response import cosine_sim

with open('dataset/ban.nad', 'r') as f:
    ban_msg = [line.strip() for line in f]
    print(f'[bad_use.debug] {len(ban_msg)} ban items loaded')

with open('dataset/positive.nad', 'r') as f:
    positive_msg = [line.strip() for line in f]
    print(f'[bad_use.debug] {len(positive_msg)} positive items loaded')

with open('dataset/negative.nad', 'r') as f:
    negative_msg = [line.strip() for line in f]
    print(f'[bad_use.debug] {len(negative_msg)} negative items loaded')


all_messages = positive_msg + negative_msg
print(f'[bad_use.debug] Total items of dataset: {len(all_messages)}')


frecuency_table = get_frecuency_table(positive_msg, negative_msg)


x = np.zeros( (len(all_messages), 3) )
y_positive = np.ones( len(positive_msg) )
y_negative = np.zeros( len(negative_msg) )
y = np.concatenate( (y_positive, y_negative), axis = 0)


for i in range(len(all_messages)):
    x[i:] = encode_message(frecuency_table, all_messages[i])


model = LogisticRegression()
model.fit(x, y)
print(f"[bad_use.debug] Model: intercept: {model.intercept_} | coef: {model.coef_}")


def get_prediction(input_msg):
    encoded_input_msg = encode_message(frecuency_table, input_msg)
    prediction = model.predict([encoded_input_msg])

    return prediction


def get_probability(input_msg):
    encoded_input_msg = encode_message(frecuency_table, input_msg)
    probability = model.predict_proba([encoded_input_msg])

    return probability

def is_message_bad_use(message):
    message = message.lower()

    message = message.replace('**', '')
    message = message.replace('?', '')
    message = message.replace('¿', '')
    message = message.replace('"', '')

    message = message.replace('á', 'a')
    message = message.replace('ó', 'o')
    message = message.replace('í', 'i')
    message = message.replace('é', 'e')
    message = message.replace('ú', 'u')
    message = message.replace(',', '')
    message = message.replace('  ', ' ')

    for keyword in positive_msg:
        data = cosine_sim(keyword, message)
        
        if data > 0.80:
            print(f'[bad_use.debug] {message} > {keyword} (probability: {data})')
            return True

    """prediction = get_prediction(message)
    probability = get_probability(message)

    print(f'[bad_use.debug] {message} (probability: {probability[0][1]})')

    if prediction[0] == 1.0:
        if probability[0][1] > 0.80:
            return True"""

    return False