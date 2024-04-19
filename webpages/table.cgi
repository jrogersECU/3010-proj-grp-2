#!/usr/bin/python3

import cgi
import psycopg2

def fetch_faculty_data_by_search(first=None, mi=None, last=None, honorific=None, email=None, phone=None, office=None, research=None, rank=None, remarks=None, order_by=None):
    try:
        # Connect to the PostgreSQL database
        conn = psycopg2.connect(
            dbname='group2db',
            user='webuser1',
            password='student',
            host='192.168.56.20'
        )
        cur = conn.cursor()

        # Default SQL query to fetch all data from the faculty table
        sql_query = "SELECT * FROM faculty WHERE 1=1"

        # Add search conditions if search parameters are provided
        if first:
            sql_query += " AND first ILIKE '%{}%'".format(first)
        if mi:
            sql_query += " AND mi ILIKE '%{}%'".format(mi)
        if last:
            sql_query += " AND last ILIKE '%{}%'".format(last)
        if honorific:
            sql_query += " AND honorific ILIKE '%{}%'".format(honorific)
        if email:
            sql_query += " AND email ILIKE '%{}%'".format(email)
        if phone:
            sql_query += " AND phone ILIKE '%{}%'".format(phone)
        if office:
            sql_query += " AND office ILIKE '%{}%'".format(office)
        if research:
            sql_query += " AND research ILIKE '%{}%'".format(research)
        if rank:
            sql_query += " AND rank ILIKE '%{}%'".format(rank)
        if remarks:
            sql_query += " AND remarks ILIKE '%{}%'".format(remarks)

        # Add ORDER BY clause if specified
        if order_by:
            sql_query += " ORDER BY {}".format(order_by)

        # Execute SQL query
        cur.execute(sql_query)
        rows = cur.fetchall()

        # Close cursor and connection
        cur.close()
        conn.close()

        return rows

    except Exception as e:
        print("<p>Error: {}</p>".format(e))
        return []

# Get query parameters from the URL
form = cgi.FieldStorage()

# Get user input from query parameters (for search)
first_query = form.getvalue('first')
mi_query = form.getvalue('mi')
last_query = form.getvalue('last')
honorific_query = form.getvalue('honorific')
email_query = form.getvalue('email')
phone_query = form.getvalue('phone')
office_query = form.getvalue('office')
research_query = form.getvalue('research')
rank_query = form.getvalue('rank')
remarks_query = form.getvalue('remarks')

# Get sorting column from query parameters
sort_by = form.getvalue('sort_by')

# Get section parameter for tabs
section = form.getvalue('section')

# Set default sorting order
default_order = "first, last"  # Sort by first name by default

# Print the content type
print("Content-type: text/html\n")

# Print the HTML content
print("<html><body>")
print("<h1>Faculty Information</h1>")
print("<form method='get' action='table.cgi'>")
print("<label for='first'>First Name:</label>")
print("<input type='text' id='first' name='first' value='{}'>".format(first_query if first_query else ''))
print("<br>")
print("<label for='mi'>Middle Initial:</label>")
print("<input type='text' id='mi' name='mi' value='{}'>".format(mi_query if mi_query else ''))
print("<br>")
print("<label for='last'>Last Name:</label>")
print("<input type='text' id='last' name='last' value='{}'>".format(last_query if last_query else ''))
print("<br>")
print("<label for='honorific'>Honorific:</label>")
print("<input type='text' id='honorific' name='honorific' value='{}'>".format(honorific_query if honorific_query else ''))
print("<br>")
print("<label for='email'>Email:</label>")
print("<input type='text' id='email' name='email' value='{}'>".format(email_query if email_query else ''))
print("<br>")
print("<label for='phone'>Phone:</label>")
print("<input type='text' id='phone' name='phone' value='{}'>".format(phone_query if phone_query else ''))
print("<br>")
print("<label for='office'>Office:</label>")
print("<input type='text' id='office' name='office' value='{}'>".format(office_query if office_query else ''))
print("<br>")
print("<label for='research'>Research Interest:</label>")
print("<input type='text' id='research' name='research' value='{}'>".format(research_query if research_query else ''))
print("<br>")
print("<label for='rank'>Rank:</label>")
print("<input type='text' id='rank' name='rank' value='{}'>".format(rank_query if rank_query else ''))
print("<br>")
print("<label for='remarks'>Remarks:</label>")
print("<input type='text' id='remarks' name='remarks' value='{}'>".format(remarks_query if remarks_query else ''))
print("<br>")
print("<input type='submit' value='Search'>")
print("</form>")
print("<form method='get' action='table.cgi'>")
print("<input type='hidden' name='section' value='{}'>".format(section))
print("<input type='submit' name='sort_by' value='first'>Sort by Name")
print("<input type='submit' name='sort_by' value='rank'>Sort by Rank")
print("</form>")

# New tab for Courses
print("<form method='get' action='table.cgi'>")
print("<input type='hidden' name='section' value='courses'>")
print("<input type='submit' value='Courses'>")
print("</form>")

# New tab for FTE
print("<form method='get' action='table.cgi'>")
print("<input type='hidden' name='section' value='fte'>")
print("<input type='submit' value='FTE'>")
print("</form>")

# New tab to return to Faculty table
print("<form method='get' action='table.cgi'>")
print("<input type='submit' value='Faculty Table'>")
print("</form>")

# Fetch data based on section and sorting option
if section == 'courses':
    try:
        # Fetch data from the courses table
        conn = psycopg2.connect(
            dbname='group2db',
            user='webuser1',
            password='student',
            host='192.168.56.20'
        )
        cur = conn.cursor()
        cur.execute("SELECT * FROM courses")
        rows = cur.fetchall()
        cur.close()
        conn.close()

        # Print table rows
        print("<table border='1'>")
        for row in rows:
            print("<tr>")
            for col in row:
                print("<td>{}</td>".format(col))
            print("</tr>")
        print("</table>")

    except Exception as e:
        print("<p>Error: {}</p>".format(e))

elif section == 'fte':
    print('placeholder for FTE section')

else:
    # Fetch faculty data based on search parameters
    order_by = sort_by if sort_by else default_order
    rows = fetch_faculty_data_by_search(first_query, mi_query, last_query, honorific_query, email_query, phone_query, office_query, research_query, rank_query, remarks_query, order_by)

    # Print table rows
    print("<table border='1'>")
    for row in rows:
        print("<tr>")
        for col in row:
            print("<td>{}</td>".format(col))
        print("</tr>")
    print("</table>")
print("</body></html>")

