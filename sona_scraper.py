from bs4 import BeautifulSoup
import mechanize
import datetime
import os
import yaml
import urlparse


url='https://stanford-etkinlab.sona-systems.com'
username=''
password=''

admin=''
passwd=''

br = mechanize.Browser()

# Settings
br.set_handle_robots(False)
br.addheaders = [('User-agent', 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.1) Gecko/2008071615 Fedora/3.0.1-1.fc9 Firefox/3.0.1')]

# Open page and select login form
#main= mechanize.urlopen(url)
mainpage = urlparse.urlparse(url)
mainpage = '{0}://{1}'.format(mainpage.scheme, mainpage.netloc)
br.open(mainpage)
br.select_form(name="aspnetForm")

# Fill out and submit form
br["ctl00$ContentPlaceHolder1$userid"] = username
br["ctl00$ContentPlaceHolder1$pw"] = password

response = br.submit()
print response.read()
new=response.geturl()

# Open studies page
slots_html = br.open(new)
print slots_html
test=slots_html.get_data()

# Soupify
soup = BeautifulSoup(test, "html.parser")


# Get the studies rows
slot_rows=soup.select('span')
print slot_rows



# header and body of html data
html_col_header = slot_rows[0]
html_tbl_body = slot_rows[1:]

text=[]
for x in html_tbl_body:
	text.append(x.get_text())

clean_text=[]
for x,y in enumerate(text):
    print y
    clean_text.append(y.format())
    print y.format()