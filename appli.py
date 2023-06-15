from flask import Flask, render_template, request
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config["MYSQL_HOST"] = "127.0.0.1"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = "foo"
app.config["MYSQL_DB"] = "SAE41"
mysql = MySQL(app)

@app.route("/", methods = ["POST", "GET"])
def login():
	if request.method == "POST":
		username = request.form["username"]
		password = request.form["password"]
		cursor = mysql.connection.cursor()
		query = "SELECT username, password FROM users WHERE username = %s AND password = %s"
		cursor.execute(query, (username, password))
		result = cursor.fetchall()
		cursor.close()

		if result is not None: 
			return render_template("login.html")
		else:
			return render_template("index.html")

	return render_template("index.html")

@app.route("/index.html", methods = ["POST", "GET"])
def login():

	if request.method == "POST":
		username = request.form["username"]
		password = request.form["password"]
		cursor = mysql.connection.cursor()
		query = "SELECT username, password FROM users WHERE username = %s AND password = %s"
		cursor.execute(query, (username, password))
		result = cursor.fetchall()
		cursor.close()

		if result is not None: 
			return render_template("login.html")
		else:
			return render_template("index.html")

	return render_template("index.html")

@app.route("/register.html", methods=["GET", "POST"])
def register():

	if request.method == "POST":
		username = request.form["id"]
		password = request.form["mdp"]
		cursor = mysql.connection.cursor()
		query = "INSERT INTO users (username, password) VALUES (%s, %s)"
		cursor.execute(query, (username, password))
		mysql.connection.commit()
		cursor.close()
		return render_template("inscrit.html")
	
	return render_template("register.html")

if __name__ == "__main__":
    app.run()
