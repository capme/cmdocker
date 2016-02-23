Instructions
------------
here you can find some run command or create docker-compose to run on various system


Config
------
- config/crontab for running schedule task base on your spesific needs
- config/nginx/sites/default for setting nginx to point your web environment
- config/php56/www.conf for php-fpm configuration
- config/redis/redis.conf redis config will use this file
- config/supervisor/*.ini all worker in here will be using by supervisor

Development
-----------
development using dev-docker-compose.yml
```
docker-compose dev-decker-compose.yml up
```


Production
----------
available soon


Local
-----
create my-docker-compose.yml from renaming example-docker-compose.yml and configure to your environment needs
```
docker-compose my-docker-compose.yml up
```