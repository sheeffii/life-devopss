 resource "docker_image" "apache" {
  name = "bitnami/kafka:latest"
}

resource "docker_container" "apache" {
  image = docker_image.apache.image_id
  name  = "postgres"

  ports {
    internal = 9092
    external = 9092
  }

  networks = ["my_network"]

  env = [
       "KAFKA_BROKER_ID=1",
       "KAFKA_CFG_LISTENERS=PLAINTEXT://:9092",
       "KAFKA_CFG_ADVERTISED_LISTENERS=PLAINTEXT://127.0.0.1:9092",
       "KAFKA_CFG_ZOOKEEPER_CONNECT=zookeeper:2181",
       "ALLOW_PLAINTEXT_LISTENER=yes"  
  ]
    
  provisioner "local-exec" {
     command = "/opt/bitnami/kafka/bin/kafka-topics.sh --list  --bootstrap-server kafka-server:9092"
  }  

}
