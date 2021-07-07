from flask import Flask,render_template,request,session,redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import os
from werkzeug.utils import secure_filename
import math
import json


with open('config.json','r') as c:
    params = json.load(c)["params"]

local_server = True
app = Flask(__name__)
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_server']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] =params['prod_server']
    
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.secret_key = 'thevisionblog'
app.config['UPLOAD_FOLDER'] = 'E:\\flask\\static\\assets\\img'
db = SQLAlchemy(app)

class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(80), nullable=False)
    Email = db.Column(db.String(120),  nullable=False)
    Phone = db.Column(db.String(120),  nullable=False)
    Message = db.Column(db.String(120),  nullable=False)

@app.route("/contact", methods=["GET","POST"])
def contact():
    if (request.method=="POST"):
        name = request.form.get("name")
        email = request.form.get("email")
        phone = request.form.get("phone")
        message = request.form.get("message")
        entry = Contacts(Name=name,Email=email,Phone=phone,Message=message)
        db.session.add(entry)
        db.session.commit()
        
    return render_template("contact.html")


@app.route("/")
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_posts']))
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page-1)*int(params['no_of_posts']):(page-1)*int(params['no_of_posts'])+ int(params['no_of_posts'])]
    if page==1:
        prev = "#"
        next = "/?page="+ str(page+1)
    elif page==last:
        prev = "/?page="+ str(page-1)
        next = "#"
    else:
        prev = "/?page="+ str(page-1)
        next = "/?page="+ str(page+1)
    
    return render_template('index.html', params=params, posts=posts, prev=prev, next=next)

@app.route("/about")
def about():
    return render_template ("about.html")

@app.route("/dashboard" , methods=["GET","POST"])
def dashboard():
    if ('user' in session and session['user'] == "your-email@gmail.com"):
        posts=Posts.query.all()
        return render_template('dashboard.html', posts=posts,params=params)

    if request.method == "POST":
        username = request.form.get('username')
        password = request.form.get ('password')
        if (username == "your-email@gmail.com" and password == "your-password"):
            session['user'] = username
            posts=Posts.query.all()
            return render_template('dashboard.html' , posts=posts,params=params)

    return render_template ("login.html",params=params)

class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    tag_line = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(120),  nullable=False)
    content = db.Column(db.String(120),  nullable=False)
    date = db.Column(db.String(120),  nullable=True)


@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post=Posts.query.filter_by(slug = post_slug).first()
    return render_template ("post.html", post = post )

@app.route("/uploader", methods=["GET","POST"])
def uploader():
    if ('user' in session and session['user'] == "your-email@gmail.com"):
        if (request.method == "POST"):
            f = request.files["file1"]
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename) ))
            return "Uploaded Successfully"

@app.route("/edit/<string:sno>", methods=["GET","POST"])
def edit(sno):
    if ('user' in session and session['user'] == "your-email@gmail.com"):
        if request.method == "POST":
            box_title = request.form.get('title')
            tag_line =request.form.get('tag_line')
            slug= request.form.get('slug')
            content = request.form.get('content')
            date = datetime.now()

            if sno == '0' :
                post= Posts(title=box_title, tag_line=tag_line, slug=slug , content=content ,date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post=Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.tag_line=tag_line
                post.slug = slug
                post.content = content
                post.date = date
                db.session.commit()
                return redirect("/edit/" +sno )
        post=Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html',post=post,sno=sno)

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect ('/dashboard')

@app.route("/delete/<string:sno>", methods=["GET","POST"])
def delete(sno):
    if ('user' in session and session['user'] == "your-email@gmail.com"):
        post= Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
        return redirect('/dashboard')


if __name__== "__main__":
    app.run(debug=True , port=8000)
