import requests


def get_random_image_some_api():
    url = 'https://some-random-api.ml/img/dog'

    return requests.get(url).json()
