import csv
import requests
from bs4 import BeautifulSoup
with open('E:\Test.csv', mode='w' ,newline='') as doc_file:
    doc_writer = csv.writer(doc_file, delimiter=';', quotechar='"', quoting=csv.QUOTE_MINIMAL)
    fieldnames = ['Doctor name', 'Doctor speciality', 'Doctor adress','Telephone','Telephone portable','Fixe']
    doc_writer.writerow(fieldnames)
    for specialite in range(2,3):
        try:
            document = requests.get("https://www.sahti-dz.com/recherche.aspx?p=0&sp="+str(specialite)+"&w=&c=&s=&disp=&sort=1&page=1#ShowResults")
            print("https://www.sahti-dz.com/recherche.aspx?p=0&sp="+str(specialite)+"&w=&c=&s=&disp=&sort=1&page=1#ShowResults")
            soup = BeautifulSoup(document.content,features="html.parser")
            rows = soup.find_all("div",{"class":"row"})[2].find_all("div",{"class":"col-lg-12 col-md-12 col-sm-12 col-xs-12"})
            for row in rows:
                my_List = [row.find_all("p")[0].text.strip(),row.find_all("p")[1].text.strip(),row.find_all("small")[0].text.strip(),row.find_all("small")[1].text.strip()]
                print(my_List)
                doc_writer.writerow(my_List)
                
            maxSuivant = len(soup.find_all("div",{"class":"btn-group pull-right"})[1]) +1
            for page in range(2,maxSuivant):
                try:
                    document = requests.get("https://www.sahti-dz.com/recherche.aspx?p=0&sp="+str(specialite)+"&w=&c=&s=&disp=&sort=1&page="+str(page)+"#ShowResults")
                    soup = BeautifulSoup(document.content)
                    rows = soup.find_all("div",{"class":"row"})[2].find_all("div",{"class":"col-lg-12 col-md-12 col-sm-12 col-xs-12"})
                    for row in rows:
                        my_List = [row.find_all("p")[0].text.strip(),row.find_all("p")[1].text.strip(),row.find_all("small")[0].text.strip(),row.find_all("small")[1].text.strip()]
                        print(my_List)
                        doc_writer.writerow(my_List)
                except:
                    continue
        except:
            continue
