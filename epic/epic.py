from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver import DesiredCapabilities
import time


#options = webdriver.ChromeOptions()
#options.add_argument('--ignore-certificate-errors')
#options.add_argument("--test-type")
#options.binary_location = "/usr/bin/chromedriver"
#dr = webdriver.Chrome(chrome_options=options)

dr = webdriver.Chrome('/usr/bin/chromedriver')

print("Before")
dr.get("http://oshinoaj.blog.fc2.com/blog-entry-33.html")
print("dr.get ok")
time.sleep(3)
#charts = dr.find_elements(By.CLASS_NAME, 'main-body')
 
dr.save_screenshot("/home/seluser/test/epic/full.png")


from PIL import Image

img = Image.open("/home/seluser/test/epic/full.png")
print(img.size)
cropped = img.crop((50,170,648,684))
cropped.save("/home/seluser/test/epic/base.png")
dr.close()
