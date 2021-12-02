FROM python:3.7.12-buster

COPY . /app

WORKDIR /app

RUN pip install --no-cache -r requirements.txt

CMD [ "python", "app.py" ]
