import csv
import requests
from bs4 import BeautifulSoup
with open('E:\Hopitaux.csv', mode='w+') as doc_file:
    doc_writer = csv.writer(doc_file, delimiter=';', quotechar='"', quoting=csv.QUOTE_MINIMAL)
    fieldnames = ['Hospital name', 'Owner', 'Hospital adress','Phone']
    doc_writer.writerow(fieldnames)
    for id in range(1,24):
        try:
            url = "https://www.lespagesmaghreb.com/annuaire/algerie/pharmacies/ef9703?page="+str(id)
            document = requests.get(url)
            print(url)
            soup = BeautifulSoup(document.text,features="html.parser")
            rows1 = soup.find_all("div",{"class":"list-firms"})[0].find_all("div",{"class":"col-md-12 col-xs-12 firm"})
            rows2 = soup.find_all("div",{"class":"list-firms"})[0].find_all("div",{"class":"col-md-12 col-xs-12 firm odd"})
            for row in range(len(rows1)+len(rows2)):
                name = soup.find_all("h3",{"class":"listing-title"})[row].find_all("a")[0].text.strip()
                owner = soup.find_all("div",{"class":"listing-content"})[row].find_all("p",{"class":"juridique-name"})[0].text.strip()
                adress = soup.find_all("div",{"class":"listing-address"})[row].find_all("p",{"class":"address-location"})[0].text.strip()
                #phone_img = soup.find_all("div",{"class":"item-actions"})[row].find_all("p",{"class":"adress-phone-number"})[0].find_all()
                List = [name, owner, adress]
                print(List)                
                doc_writer.writerow(List)
        except:
            continue