cd /home/apps/selenium
rm -rf output
mkdir output
google-chrome --disable-dev-shm-usage --remote-debugging-port=9222 --no-default-browser-check --disable-fre --no-first-run &
sleep 5
python -m robot --outputdir output --logtitle "Task log" task.robot
pkill -f chrome
