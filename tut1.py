from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from flask_mail import Mail
import json

app = Flask(__name__)
with open("congif.json",'r') as c:
    params = json.load(c)["params"]

app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['gmail-username'],
    MAIL_PASSWORD=params['gmail-password']
)
mail = Mail(app)
if params['local_server']:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)


class Customer_detail(db.Model):
    '''' sno, date, full_name, email, mobile_number, problem, brand, model, description'''
    sno = db.Column(db.Integer, primary_key=True)
    date = db.Column(db.String(80), unique=True, nullable=False)
    full_name = db.Column(db.String(120), unique=False, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=True)
    mobile_number = db.Column(db.String(120), unique=True, nullable=False)
    problem = db.Column(db.String(120), unique=False, nullable=False)
    brand = db.Column(db.String(120), unique=False, nullable=False)
    model = db.Column(db.String(120), unique=False, nullable=False)
    description = db.Column(db.String(120), unique=False, nullable=False)


@app.route('/')
def home():
    return render_template('index.html', params=params)


@app.route('/about')
def about():
    return render_template('about.html', params=params)


@app.route('/contact', methods=['GET', 'POST'])
def contact():
    '''' sno, date, full_name, email, mobile_number, problem, brand, model, description '''
    if request.method == 'POST':
        name = request.form.get('fullname')
        email = request.form.get('email')
        mobile_number = request.form.get('mobile')
        problem = request.form.get('prob')
        brand = request.form.get('brand')
        model = request.form.get('model')
        description = request.form.get('des')
        entry = Customer_detail(date=datetime.now(), full_name=name, email=email, mobile_number=mobile_number, problem=problem,
                         brand=brand, model=model, description=description)
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from Customer : ' + name,
                          sender=email,
                          recipients=[params['gmail-username']],
                          body="Name of customer : "+name + "\n" +
                               "Email of customer : " + email + "\n" +
                               "Mobile number of customer : "+mobile_number + "\n" +
                               "Problem : "+problem +"\n" +
                               "Brand : "+brand + "\n" +
                               "Model : "+model + "\n" +
                               "Problem description : "+description
                          )
        return render_template('index.html', params=params)
    return render_template('contact.html', params=params)


@app.route('/service')
def service():
    return render_template('service.html', params=params)


@app.route('/why')
def why():
    return render_template('why.html', params=params)


app.run(debug=True)
