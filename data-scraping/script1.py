import csv
import requests
from bs4 import BeautifulSoup
with open('E:\DocteursAlgerien2.csv', mode='w+', newline='') as doc_file:
    doc_writer = csv.writer(doc_file, delimiter=';', quotechar='"', quoting=csv.QUOTE_MINIMAL)
    fieldnames = ['Doctor name', 'Doctor speciality', 'Doctor adress','Telephone','Telephone portable','Fixe']
    doc_writer.writerow(fieldnames)
    for id in range(5414,9128):
      try:
          document = requests.get("https://dzdoc.com/profil.php?id="+str(id))
          print("https://dzdoc.com/profil.php?id="+str(id))
          soup = BeautifulSoup(document.text,features="html.parser")
          doc_name = soup.find_all("h3",{"class":"doctor-name"})
          speciality = soup.find_all("h4",{"class":"no-margin"})
          adresse = soup.find_all("div",{"id":"adresse"})
          ll = soup.find_all("div",{"class":"col-md-5"})[0].find_all("ul",{"class":"unstyled"})[0].find_all("li")
          if (len(ll)>=1) :
              k = [ ll[i].text for i in range(len(ll))] 
              List = [doc_name[0].text.strip(),speciality[0].text.strip(),adresse[0].text.strip()]
              for j in k :
                  List.append(j)
              print(List)
              doc_writer.writerow(List)
      except:
          continue
          