from flask import Flask, render_template, request, abort, jsonify
from flask_sqlalchemy import SQLAlchemy
from models import Links

from api import get_random_image_some_api

app = Flask(__name__)
app.config.from_pyfile('config.py')
db = SQLAlchemy(app)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/favorites')
def favorites():
    return render_template('favorites.html')

@app.route('/random', methods=['GET'])
def get_random_image():
    return get_random_image_some_api()

@app.route('/add', methods=['POST'])
def add_image():
    if not request.json or not 'link' in request.json:
        abort(400)

    link = request.json['link']
    id = hash(link)

    oldLink = Links.query.get(id)

    if oldLink:
        return jsonify({
            'success':False,
            'error': 'Already in database'
        }), 401, {'ContentType':'application/json'}

    linkRecord = Links(id, link)
    db.session.add(linkRecord)
    db.session.commit()
    return jsonify({'success':True}), 200, {'ContentType':'application/json'}


@app.route('/get-all')
def get_all_images():
    links = Links.query.all()
    return jsonify([i.serialize for i in links]), 200, {'ContentType':'application/json'}


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
