"""
	Example of mini API in Flask
"""


from flask import Flask,jsonify,json

app = Flask(__name__)

with open('data/books.json') as json_data:
    books = json.load(json_data)

@app.route('/')
def home():
	return "This is Flask on your localhost  (: "


@app.route('/route')
def ma_route():
    return"Test "


@app.route('/books', methods=["GET"])
def get_books():
    return jsonify({'books':books})

@app.route('/books/<int:id>', methods=["GET"])
def get_book(id):
    book = books[id]
    return jsonify({'books':book})

if __name__ == '__main__':
	app.run()

