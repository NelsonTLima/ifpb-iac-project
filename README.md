# Documentação do Projeto

## Informações gerais

Este projeto se trata da avaliação da disciplina de Admisnistração de Sistemas
Abertos ministrada no Curso Tecnólogo Superior em Redes de Computadores do
Instituto Federal da Paraíba. Nesta avaliação foram abordados conteúdos de:

- Vagrant;
- Ansible;
- Configuração do sistemas e servisos de SUDO, SSH, NFS E LVM;

Autoria: Nelson Túlio De Menezes Lima. 4º Período.

## 1. Objetivo do Projeto

Desenvolver competências práticas em DevOps e Infraestrutura como Código (IaC)
Utilizando as ferramentas Vagrant e Ansible. Os estudantes devem provisionar
uma infraestrutura virtual e automatizar a configuração do sistema operacional
e de serviços essenciais.

Nota do aluno.:

- O código está todo escrito em inglês como forma de manter uma coerência
contextual.

## 2. Escopo do Projeto

### 2.1. Provisionamento da Infraestrutura com Vagrant

- Provider: VirtualBox;
- Box: `generic/debian12`;
- Configuração da VM:
  - Memória RAM: 1024 MB;
  - Discos adicionais: 3 discos de 10 GB cada;
  - Endereço IP: 192.168.57.10;
  - Nome da VM: "p01-Nelson"

O Vagrantfile foi configurado para provisionar a infraestrutura descrita acima
.

Notas do Aluno.:

- Para o nome da máquina optou-se por usar apenas p01-Nelson
por se tratar de apenas um integrante no grupo. Além disso, no Vagrantfile o
disco principal é criado expressamente para garantir que ele será mapeado
como /dev/sda pelo linux.

### 2.2 Configuração Automática com Ansible

Após o provisionamento da VM, o Ansible será invocado automaticamente pelo
Vagrant para configurar o sistema operacional e instalar pacotes necessários.
As seguintes atividades foram realizadas:

- [x] Realizar uma atualização completa no Sistema Operacional, incluindo os
 pacotes.
- [x] Alterar o Hostname para p01-Nelson
- [x] Criar dois usuários (optou-se por nome e outro sobrenome).
- [x] Configurar mensagem de saudação.
- [x] Permitir que usuários do grupo "ifpb" tenham acesso de root com o sudo.
- [x] Permitir apenas autenticação por chaves públicas.
- [x] Bloquear acesso ao root via SSH.
- [x] Permitir acesso apenas para usuários pertencentes ao grupo "acesso_ssh".
- [x] Gerar e configurar chaves publicas para os usuários criados no item 2.2.3
- [x] Utilizar os 3 discos para criar um VG chamado "dados".
- [x] Criar um LV chamado "sistema" com 15 Gb de tamanho.
- [x] Formatar o LV "sistema" no formato ext4.
- [x] Configurar a partição "sistema" para ser montada automaticamente no
 diretório /dados ao iniciar o sistema.
- [x] Você deve realizar a configuração d inicialização da partição em
 `/etc/fstab`
- [x] Configurar o servidor de NFS para compartilhar o diretório/dados/nfs
 com qualquer host da rede 192.168.57.0/24.
- [x] Configurar NFS para que permita escrita no diretório apenas para o
 usuario `nfs-ifpb`.
- [x] Mapear automaticamente qualquer usuário remoto para o usuário ""nfs-ifpb"
- [x] Forçar o esvaziamento do buffer de memória para gravações imediatas no
 disco;
- [x] Remover shell do usuário "nfs-ifpb" para aumentar a segurança.
- [x] Todo usuário que acessar o sistema, deve ser adicional ao final do
 arquivo /dados/nfs/acessos informações de data_hora; nome_login; tty;
 ip_remoto.

## 2. Como levantar a infraestrutura

Primeiro será necessário colocar as chaves publicas dos usuários Nelson e Lima
na pasta `ssh_keys` do projeto com os nomes `nelson_rsa.pub` ou `lima_rsa.pub`
. Isso vai garantir acesso a quem detiver os pares privados dessas chaves.
Foram criados dois pares de chave e colocados na pasta ```ssh_keys```,
basta substitui-las com:

```bash
cp ~/.ssh/id_rsa.pub ./ssh_keys/{user}_rsa.pub
```

Sendo {user} ou "nelson" ou "lima".

Ou pode-se acessar o ssh usando as chaves privadas que estão no diretório,
basta utilizar o comando:

```bash
ssh -i ./ssh_keys/{user}_rsa {user}@192.168.57.10
```

Que o Vagrant juntamente com o Ansible cuidarão de levantar toda essa
infraestrutura.
