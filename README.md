# Microservices with consul and HAProxy As API Gateway

##### Introduction
------------
Technologies Involved

| Framework       | Description                                                   | 
| ----------------|:--------------------------------------------------------------| 
| HAProxy           | Api gateway                                                   |
| Consul          | Service Discovery                                             |  
| Docker          | Containerization                                              |  
| Sample Apps     | Spring Boot + Spring Cloud + Actuator + Rest Template         |  

##### Running
------------

```bash
$ sudo chmod +x ./start.sh ./clean.sh
$ ./start.sh
```

##### Accessing
------------

| Service         | URL                                      |
| ----------------|:-----------------------------------------|
| Consul          | http://localhost:8500/ui/                | 
| Client          | http://localhost:8080/api/clients/       | 
| Product         | http://localhost:8080/api/products/      |                 
| Invoice         | http://localhost:8080/api/invoices/      |                  
