# Desafio DIO Linux Essentials | Infraestrutura como código

O presente repositório mostra o uso de um script para criação de uma estrutura de usuários, diretórios e permissões em um sistema linux.

A ideia é exercitar e familiarizar o usuário com comandos linux com a criação de um script bash.

Segue a estrutura de usuários e grupos:

| Usuário    | Grupo   |
| ---------- | ------- |
| carlos     | GRP_ADM |
| maria      | GRP_ADM |
| joao       | GRP_ADM |
| debora     | GRP_VEN |
| sebastiana | GRP_VEN |
| roberto    | GRP_VEN |
| josefina   | GRP_SEC |
| amanda     | GRP_SEC |
| rogerio    | GRP_SEC |

## Requisitos do desafio

- [x] Excluir diretórios, arquivos, grupos e usuários criados anteriormente;
- [x] Todo provisionamento deve ser feito em um arquivo do tipo Bash Script;
- [x] O dono de todos os diretórios criados será o usuário root;
- [x] Todos os usuários terão permissão total dentro do diretório publico;
- [x] Os usuários de cada grupo terão permissão total dentro de seu respectivo diretório;
- [x] Os usuários não poderão ter permissão de leitura, escrita e execução em diretórios de departamentos que eles não pertencem;
- [x] Subir arquivo de script criado para a sua conta no GitHub.

## Tecnologias usadas

- Linux (Arch)
- Bash
