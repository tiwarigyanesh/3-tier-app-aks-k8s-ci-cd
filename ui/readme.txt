Commands used to create and run the image:

docker build -t frontend-image .
docker run -d -p 8081:80 frontend-image