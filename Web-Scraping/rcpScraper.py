from bs4 import BeautifulSoup
import requests, io

def main():

    i = 0
    n = 25

    drudge = requests.get("https://www.realclearpolitics.com/")
    soup = BeautifulSoup(drudge.content, 'html.parser')

    outputFile = open('headlines.txt', 'a')

    outputFile.write('--------------\n--------------\nRCP Headlines\n--------------\n--------------\n\n')
    try:
        for counter in range(1,n+1):
            for div in soup.findAll('div', {'class': 'story'}):
                a = div.findAll('a')[i]
                mainTitle = (a.text.strip())
                mainLink = (a.attrs['href'])
                if (i != 18): 
                    outputFile.write(mainTitle + '\n' + mainLink + '\n\n')
                i += 1
    except IndexError:
        print(i)

    
    outputFile.close()


main()
exit()
