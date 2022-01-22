from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver import DesiredCapabilities
import time

print("webdriver remote")
chrome_options = webdriver.ChromeOptions()
chrome_options.set_capability("browserVersion", "67")
chrome_options.set_capability("platformName", "Windows XP")
#dr = webdriver.Remote(command_executor='http://127.0.0.1:4444', 
#                      desired_capabilities=DesiredCapabilities.CHROME,
#                      options=chrome_options
#                     )

dr = webdriver.Chrome('/usr/bin/chromedriver')

dr.get("https://cbs.tw/alert")
time.sleep(5)
dr.save_screenshot("/home/seluser/test/cbs/cbs.png")

## html = dr.page_source


## f = open("/home/seluser/test/test.html", "w+")
## f.write(html)
## f.close()
#dr.find_element(By.Name, "q").send_keys("selenium grid4")
#dr.find_element(By.Name, "btnK").click()
dr.close()
