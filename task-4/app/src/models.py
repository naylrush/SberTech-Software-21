from flask import Flask
from flask_sqlalchemy import SQLAlchemy
db = SQLAlchemy()

class Links(db.Model):
    id = db.Column(db.BigInteger, primary_key=True)
    link = db.Column(db.String(255), nullable=False)

    def __init__(self, id, link):
        self.id = id
        self.link = link

    @property
    def serialize(self):
       return {
           'link' : self.link,
       }
