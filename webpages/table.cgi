#!/usr/bin/python3

import psycopg2

print("Content-type: text/html\n")

print("<html><body>")
print("<h1>Faculty Information</h1>")
print("<table border='1'>")

try:
    conn = psycopg2.connect(
        dbname='group2db',
        user='webuser1',
        password='student',
        host='192.168.56.20'
    )
    cur = conn.cursor()
    cur.execute("SELECT * FROM faculty")
    rows = cur.fetchall()
    for row in rows:
        print("<tr>")
        for col in row:
            print("<td>{}</td>".format(col))
        print("</tr>")
    cur.close()
    conn.close()
except Exception as e:
    print("<p>Error: {}</p>".format(e))

print("</table>")
print("</body></html>")
