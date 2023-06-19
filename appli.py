from flask import Flask, render_template, request
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config["MYSQL_HOST"] = "127.0.0.1"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = "foo"
app.config["MYSQL_DB"] = "SAE41"
mysql = MySQL(app)

@app.route("/", methods = ["POST", "GET"])
def connexion():
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
			return render_template("login.html",nom_utilisateur=nom_utilisateur)
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
			for x in result:
				global nom_utilisateur
				nom_utilisateur=x[0]
			return render_template("login.html",nom_utilisateur=nom_utilisateur)
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

@app.route("/login.html", methods = ["POST", "GET"])
def calendar():
	tableau_rdv = {}
	cursor = mysql.connection.cursor()
	user_id = "SELECT id FROM users WHERE username = nom_utilisateur"
	query = "SELECT dates FROM meetings WHERE id_owner = %s"
	cursor.execute(query, (user_id))
	result = cursor.fetchall()
	cursor.close()
	
	for x in result:
		date = x[0][:-5]
		heure = x[0][-4:]
		caractere = "h"
		taille = len(heure) // 2
		heure_finale = heure[:taille] + caractere + heure[taille:]
		tableau_rdv = {date,heure_finale}
	return render_template("login.html",date=date,heure_finale=heure_finale, tableau_rdv=tableau_rdv)

if __name__ == "__main__":
    app.run()
