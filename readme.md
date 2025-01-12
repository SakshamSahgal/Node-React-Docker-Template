To Run - 

Windows -
```
docker build
 --build-arg BACKEND_PORT=8080
 --build-arg CORS_ORIGIN=*
 --build-arg FRONTEND_PORT=8080
 -t image . ; docker run -p 80:8080 image
```

 ```
 docker build --build-arg BACKEND_PORT=8080 --build-arg CORS_ORIGIN=* --build-arg FRONTEND_PORT=8080 -t image . ; docker run -p 80:8080 image
 ```