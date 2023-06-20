from flask import Flask, redirect, render_template, request
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config["MYSQL_HOST"] = "127.0.0.1"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = "foo"
app.config["MYSQL_DB"] = "SAE41"
mysql = MySQL(app)

@app.route("/", methods = ["POST", "GET"])
def connexion():
	global nom_utilisateur
	nom_utilisateur = ""
	if request.method == "POST":
		username = request.form["username"]
		password = request.form["password"]
		cursor = mysql.connection.cursor()
		query = "SELECT username, password FROM users WHERE username = %s AND password = %s"
		cursor.execute(query, (username, password))
		result = cursor.fetchall()
		cursor.close()

		if result is not None:
			for x in result:
				nom_utilisateur=x[0]
				return redirect('/login.html')
		else:
			return render_template("index.html")

	return render_template("index.html")

@app.route("/index.html", methods = ["POST", "GET"])
def login():

	return redirect('/') 

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
	
	return render_template("register.html", nom_utilisateur=nom_utilisateur)

@app.route("/login.html", methods = ["POST", "GET"])
def calendar():

	user = nom_utilisateur
	cursor = mysql.connection.cursor()
	requete = "SELECT id FROM users WHERE username = %s"
	cursor.execute(requete, (user,))
	table = cursor.fetchall()
	cursor.close()

	for x in table:
		user_id = table[0][0]

	cursor = mysql.connection.cursor()
	query = "SELECT jour, mois, annee, heure FROM rdv WHERE id_user = %s"
	cursor.execute(query, (user_id,))
	result = cursor.fetchall()
	cursor.close()
	
	for x in result:
		day = x[0]
		month = x[1]
		year = x[2]
		hour = x[3]

	return render_template("login.html", nom_utilisateur=nom_utilisateur, user_id=user_id, day=day, month=month, year=year, hour=hour, result=result)

if __name__ == "__main__":
    app.run()
