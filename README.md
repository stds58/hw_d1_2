**Масштабировать frontend-сервис до двух реплик.**

    sudo docker service ls
    sudo docker service scale sockshop_front-end=2
    sudo docker service ps sockshop_front-end
    sudo docker service ls

**посмотреть ноды с мастера**

    sudo docker node ls

**присоединить ноды**

    sudo docker swarm join-token worker
    sudo docker swarm join --token SWMTKN-1-xxx-ip-addr:2377 <manager_ip>:2377
