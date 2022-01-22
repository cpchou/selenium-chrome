dir="/home/docker/selenium/cbs"
docker exec -it selenium-chrome python3 /home/seluser/test/cbs/cbs.py
cd ${dir}
#sha1sum -c ${dir}/cbs.png
result=$(sha1sum -c ${dir}/cbs.sha1 | grep -o "正確")
if [[ ${result} == "正確" ]]; then
echo "內容沒有更新"
#mail -s "https://cbs.tw內容無變化" cpchou0701@gmail.com < ${dir}/cbs.png
else
/bin/cp ${dir}/cbs.png ${dir}/cbs_old.png
sha1sum ${dir}/cbs.png > ${dir}/cbs.sha1
echo "https://cbs.tw/alert 內容更新" | mail -a ${dir}/cbs.png -a ${dir}/cbs_old.png -s "https://cbs.tw 內容更新" cpchou0701@gmail.com 
fi
