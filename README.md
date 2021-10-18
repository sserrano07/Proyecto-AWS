# Proyecto-AWS

## Wordpress on ECS Fargate

Ejemplo práctico de como desplegar Wordpress en ECS Fargate, mediante código utilizando Terraform.

### Tecnologías

* [Wordpress](https://wordpress.org/)
* [Docker](https://www.docker.com/)
* [Terraform](https://www.terraform.io/)
* [Amazon ECS](https://aws.amazon.com/ecs/)
* [Amazon RDS](https://aws.amazon.com/es/rds/)

### Requisitos

Para poder utilizar este ejemplo necesitaremos:

* [Terraform](https://www.terraform.io/downloads.html)


### Explicación

Desplegaremos una imagen de Wordpress ( última versión ) en un clúster bajo la tecnología ECS-Fargate de AWS. La infraestructura se desplegará mediante código utilizando Terraform. 

Los parámetros más importantes los encontrarás en el archivo 'variables.tf' siendo los más importantes:

- aws-region.
- az-count.
- app-image.

