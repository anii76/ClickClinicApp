import csv
import requests
from bs4 import BeautifulSoup
with open('E:\PharmaAlger.csv', mode='w+', newline='') as doc_file:
    doc_writer = csv.writer(doc_file, delimiter=';', quotechar='"', quoting=csv.QUOTE_MINIMAL)
    fieldnames = ['Hospital name', 'Owner', 'Hospital adress','Phone']
    doc_writer.writerow(fieldnames)
    for id in range(0,960,20):
        try:
            url = "https://www.guide-alger.com/pharmacies.html?start="+str(id)
            print(url)
            doc = requests.get(url)
            soup = BeautifulSoup(doc.text,features="html.parser") 
            dd = soup.find_all("div",{"class":"rsdir-listings"})[0].find_all("div",{"class":"row-fluid rsdir-1-columns"}) 
            for row in range(len(dd)):
                try:
                   name = soup.find_all("div",{"class":"rsdir-listings"})[0].find_all("div",{"class":"row-fluid rsdir-1-columns"})[row].find_all("h2",{"class":"rsdir-listing-title"})[0].find_all("a")[0].text.strip() 
                   k = soup.find_all("div",{"class":"rsdir-listings"})[0].find_all("div",{"class":"row-fluid rsdir-1-columns"})[row].find_all("div",{"class":"rsdir-listing-small-subtitle"})[0].text.strip().split(":")
                   j = [i.split("\r") for i in k]
                   List = [name, j[1][0], j[3][0], ''.join(j[4])]
                   print(' -- '.join(List))
                   doc_writer.writerow(List)
                except:
                    continue
        except:
            continue
