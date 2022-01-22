name="epic"
dir="/home/docker/selenium/${name}"
chown 1200:1200 -R ${dir}
docker exec -it selenium-chrome python3 /home/seluser/test/${name}/${name}.py
cd ${dir}
sha1sum -c /home/docker/selenium/epic/base.sha1 
result=$(sha1sum -c /home/docker/selenium/epic/base.sha1 | grep -o "正確")
echo dir=${dir}

if [[ ${result} == "正確" ]]; then
echo "內容沒有更新"
#mail -s "https://cbs.tw內容無變化" cpchou0701@gmail.com < ${dir}/cbs.png
else
echo "內容有變化"${result}
/bin/cp ${dir}/base.png ${dir}/old.png
sha1sum ${dir}/base.png > ${dir}/base.sha1
echo "http://oshinoaj.blog.fc2.com/blog-entry-33.html" | mail -a ${dir}/base.png -s "Epic Games免費遊戲清單 內容更新" cpchou0701@gmail.com
fi
