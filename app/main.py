from flask import Flask
from jinja2 import Environment, FileSystemLoader
import psycopg2

env = Environment(loader=FileSystemLoader("templates/"))

app = Flask(__name__)

@app.route('/')
def index():
    template = env.get_template("index.htmx")
    todo_list = ["Buy groceriess", "Walk the dog", "Finish homework"]
    return template.render(items=todo_list)

#@app.route('/add', methods=['POST'])
#def add_item():
#    new_item = request.form.get('new_item')
#    if new_item:
#        todo_list.append(new_item)
#    return render_template('index.html', items=todo_list)
#
#@app.route('/remove/<int:index>', methods=['POST'])
#def remove_item(index):
#    if 0 <= index < len(todo_list):
#        del todo_list[index]
#    return render_template('index.html', items=todo_list)

@app.route('/incidents')
def incidents():

    # Connect to your postgres DB
    conn = psycopg2.connect(
        dbname="postgres",
        user="postgres",
        password="postgres",
        host="db"
    )
    # Open a cursor to perform database operations
    cur = conn.cursor()
    # Execute a query
    cur.execute("SELECT * FROM incidents")
    # Retrieve query results
    incidents_list = cur.fetchall()

    template = env.get_template("incidents.htmx")
    return template.render(items=incidents_list)

if __name__ == '__main__':
    app.run(debug=True, port=5000)