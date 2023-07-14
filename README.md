[![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/silvio-godinho/cron-job/badge)](https://securityscorecards.dev/viewer/?uri=github.com/silvio-godinho/cron-job)


# Cron-job
 
Aplicação feita com nodejs, utilizando as biblioteca do node-cron e fs, funcionando da seguinte maneira: a cada hora é gerado um arquivo txt com a hora da sua criação e o mesmo é enviado para um bucket S3 dentro da AWS, utilizando a biblioteca aws-sdk. A aplicação pode ser rodada localmente através de um contêiner, dentro do projeto temos as dependências necessárias. Para subir a aplicação localmente use o seguinte comando:
 
docker-compose up -d
 
**Obs: È necessário possuir o docker e o docker-compose instalados em sua maquina, para mais informações consulte o link da documentação abaixo:
 
https://docs.docker.com/engine/install/
 
https://docs.docker.com/compose/install/
 
Através desse comando, vai ser construída uma imagem node-alpine com nossa aplicação em um contêiner
 
# Infra via Terraform
 
Para subir a aplicação dentro de uma VM na AWS, o projeto consta com toda parte da infraestrutura necessária para a criação da EC2 e do bucket S3, escrita em código utilizando a linguagem TERRAFORM, em que além da criação dessas dependências, contém o exemplo de como subir também alguns recursos de segurança como um security group, um IAM e a criptografia das chaves de conexão da aws cli. Para criar a infra dentro da AWS é necessário ter uma conexão válida com a AWS que pode ser feita através da AWS CLI, após configurar suas credenciais em sua máquina e dentro do arquivo ponto .env da aplicação, já será possível subir a infra e após isso fazer o deploy da aplicação via Docker-Machine. Abaixo deixo algumas referências que podem ajudar na instalação do terraform, aws-cli e um tutorial de como usar o docker-machine para realizar o deploy da aplicação.


Instalar Terraform: 

https://developer.hashicorp.com/terraform/downloads

Instalar AWS-CLI:

https://aws.amazon.com/pt/cli/

Instalar Docker-Machine:

https://docker-docs.netlify.app/machine/install-machine/

Tutorial de como usar o docker-machine para deploy da aplicação:

https://www.youtube.com/watch?v=kqBCHYf_adA

