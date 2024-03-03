from flask import Flask, render_template
import psycopg2

app = Flask(__name__)

def getdatafromdatabase():
    # Connect to the PostgreSQL database
    conn = psycopg2.connect(
        dbname='group2db',
        user='student',
        password='student',
        host='localhost'
    )
    cur = conn.cursor()

    # Execute SQL query to fetch data
    cur.execute("SELECT * FROM faculty2")
    data = cur.fetchall()

    # Close cursor and connection
    cur.close()
    conn.close()

    return data

@app.route('/')
def index():
    # Get data from the database
    data = getdatafromdatabase()
    # Render the template with data
    return render_template('faculty2.html', data=data)

if __name__ == '__main__':
    app.run(debug=True)
