**Масштабировать frontend-сервис до двух реплик.**

    sudo docker service ls
    sudo docker service scale sockshop_front-end=2
    sudo docker service ps sockshop_front-end
    sudo docker service ls
