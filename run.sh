if [ "$1" = "pokelooter" ]; then
    PORT=8000
elif [ "$1" = "pokelooter1" ]; then
    PORT=8001
elif [ "$1" = "pokelooter2" ]; then
    PORT=8002
else
    echo "User $1 is not allowed to use this service"
    exit 1
fi
echo "service is running on port $PORT"
#cd /opt/pokemongo-api-demo
rm -rf $1
mkdir $1
cp index.html $1
cp config.json $1
cp data.json $1
cd $1
python -m SimpleHTTPServer $PORT &>/dev/null &
cd ..
python main.py -u $1 -p $2 -l "$3"
