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

Para poder  desplegar esta infraestructura  necesitaremos un usuario con permisos totales en :

- VPC
- ECS
- IAM
- EC2

Este usuario deberá disponer de una 'access key' y un 'secret key' válidos. 


### Explicación

Desplegaremos una imagen de Wordpress ( última versión ) en un clúster bajo la tecnología ECS-Fargate de AWS. La infraestructura se desplegará mediante código utilizando Terraform. 

Explicaré archivo por archivo el funcionamiento de éste y que despliega dicho archivo.

- **alb.tf** : En este archivo se incluye el código necesario para desplegar el balanceador de carga.
- **auto_scaling.tf** : En este archivo se incluye el código necesario para crezca y decrezca en función del número de peticiones.
- **ecs.tf** : En este archivo se incluye el código necesario para poder desplegar tanto el clúster, el ecs service, la task definition y para poder asociar dicho clúster al balanceador de carga y a la configuración de red.
- **logs.tf** : En este archivo se incluye el código necesario para quede registro de la actividad de nuestra aplicación mediante CloudWatch.
- **netwrok.tf** : En este archivo se incluye el código necesario para desplegar la VPC, con las subredes públicas y privadas, en la zona de disponibilidad correspondiente, su cidr block, tablas de ruta, internet gateway, etc.
- **outputs.tf** : En este archivo se incluye el output que nos saldrá cuando toda la infraestructura esté desplegada. ( Este output será la dirección dns del alb que nos      permitirá acceder a nuestra web )
- **provider.tf** : En este archivo se introducen las credenciales del usuario, el proveedor y la región donde se va a desplegar la infraestructura.
- **roles.tf** : En este archivo se incluye el código para crear determinados roles y políticas de IAM para las task definitions.
- **security.tf** : En este archivo se incluye el código para definir los diferentes security groups.
- **variables.tf** : En este archivo se incluyen todas las variables utilizadas para desplegar esta infraestructura. Las variables que necesitamos declarar son:
    - vpc_name: En esta variable declararemos el nombre que obtendrá nuestra VPC, con el objetivo de poder diferenciarla fácilmente del resto de VPCs.
    - aws_region: En esta variable le diremos a AWS en qué región queremos que se despliegue nuestra infraestructura.
    - ecs_task_execution_role_name: En esta variable le daremos nombre al rol para poder ejecutar la task definition.
    - az_count: En esta variable definiremos en cuantas zonas de disponibilidad desplegaremos nuestra infraestructura, con el objetivo de que ésta sea tolerante a fallas.
    - app_image: En esta variable se definirá la imagen que queremos usar para nuestra aplicación, en este caso Wordpress.
    - app_port: En esta variable definiremos desde que puerto queremos que redirija el tráfico la imagen del docker.
    - app_count: En esta variable definiremos cuantos contenedores de docker queremos lanzar.
    - health_check_path: En esta variable definiremos la ruta donde nuestro alb irá a comprobar que el contenedor está funcionando correctamente.
    - fargate_cpu: En esta variable definiremos cuantas unidades de CPU queremos que tenga la instancia de nuestro clúster.
    - fargate_memory: En esta variable definiremos la cantidad de memoria, en MiB, que queremos que tenga la instancia de nuestro clúster.
    - username: En esta variable definiremos el nombre de usuario por el que nuestro Wordpress nos habilitará el acceso.
    - password: En esta variable definiremos la contraseña de nuestro usuario en Wordpress.

#### Uso de Terraform.
 
 Lo primero que deberemos hacer será instalar Terraform en nuestro equipo. En mi caso al utilizar comandos de Linux, pondré los comandos para instalarlo.
 Descargaremos la última versión de Terraform:
 ```$ wget https://releases.hashicorp.com/terraform/0.14.3/terraform_0.14.3_linux_amd64.zip```
 

    


