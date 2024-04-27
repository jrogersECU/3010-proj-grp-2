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
            host='localhost',
	    port='5432'
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
            host='localhost'
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
    try:
        # Get query parameters from the URL
        form = cgi.FieldStorage()

        # Get search parameters from the URL
        search_faculty = form.getvalue('faculty')
        search_year = form.getvalue('year')
        search_semester = form.getvalue('semester')

        # Connect to the PostgreSQL database
        conn = psycopg2.connect(
            dbname='group2db',
            user='webuser1',
            password='student',
            host='localhost'
        )
        cur = conn.cursor()

        # Fetch data from the faculty and schedule tables based on search parameters
        sql_query = """
            SELECT 
                f.honorific || ' ' || f.first || ' ' || f.last AS faculty_name,
                s.year,
                s.semester,
                c.number,
                c.ch,
                c.prefix,
                c.gu,
                s.enrollment
            FROM 
                faculty f 
            JOIN 
                schedule s ON f.id = s.instructor
            JOIN
                courses c ON s.number = c.number
            WHERE 1=1
        """
        if search_faculty:
            # Search for any part of the faculty name
            sql_query += " AND (f.honorific || ' ' || f.first || ' ' || f.last ILIKE '%{}%')".format(search_faculty)
        if search_year:
            sql_query += " AND s.year = '{}'".format(search_year)
        if search_semester:
            sql_query += " AND s.semester ILIKE '%{}%'".format(search_semester)

        cur.execute(sql_query)
        rows = cur.fetchall()

        # Initialize FTE variable
        fte = 0.0

        # Print search form
        print("<form method='get' action='table.cgi'>")
        print("<input type='hidden' name='section' value='fte'>")
        print("<label for='faculty'>Faculty:</label>")
        print("<input type='text' id='faculty' name='faculty' value='{}'>".format(search_faculty if search_faculty else ''))
        print("<label for='year'>Year:</label>")
        print("<input type='text' id='year' name='year' value='{}'>".format(search_year if search_year else ''))
        print("<label for='semester'>Semester:</label>")
        print("<input type='text' id='semester' name='semester' value='{}'>".format(search_semester if search_semester else ''))
        print("<input type='submit' value='Search'>")
        print("</form>")

        # Print table header
        print("<table border='1'>")
        print("<tr><th>Faculty Name</th><th>Year</th><th>Semester</th><th>FTE</th></tr>")

        # Print faculty names, year, semester, and an empty column for FTE
        for row in rows:
            faculty_name = row[0]
            year = row[1]
            semester = row[2]
            number = row[3]
            ch = row[4]
            prefix = row[5]
            gu = row[6]
            enrollment = row[7]

            # Determine the appropriate formula based on prefix and gu
            if prefix == 'CSCI':
                if gu == 'U':
                    fte = (ch * enrollment) / 406.24
                elif gu == 'G':
                    fte = (ch * enrollment) / 186.23
            elif prefix == 'SENG':
                if gu == 'U':
                    fte = (ch * enrollment) / 232.25
                elif gu == 'G':
                    fte = (ch * enrollment) / 90.17
            elif prefix == 'DASC':
                fte = (ch * enrollment) / 186.23
            else:
                fte = 'N/A'  # No matching prefix, set FTE as 'N/A'

            print("<tr><td>{}</td><td>{}</td><td>{}</td><td>{:.2f}</td></tr>".format(faculty_name, year, semester, fte))

        print("</table>")
        
        cur.close()
        conn.close()
        
    except Exception as e:
        print("<p>Error: {}</p>".format(e))


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

