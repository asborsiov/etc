apiToken=11111111:11111111111111
chatId=-10011111111
echo 87.245.212.197 api.telegram.org >> /etc/hosts
curl -s -X POST -o /dev/null https://api.telegram.org/bot$apiToken/sendMessage \
        -d text="$*" \
        -d chat_id=$chatId
