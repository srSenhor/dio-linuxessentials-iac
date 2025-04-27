#!/bin/bash

# Indexando algumas listas com os grupos e os usuários

declare -a users_adm
users_adm=(carlos maria joao)

declare -a users_ven
users_ven=(debora sebastiana roberto)

declare -a users_sec
users_sec=(josefina amanda rogerio)

declare -a groups
groups=(GRP_ADM GRP_VEN GRP_SEC)

# Removendo os diretórios, grupos e usuários anteriores

echo "🗑️ Removendo diretorios, grupos e usuarios anteriores"

sudo rm -rf /publico /adm /ven /sec

for user in "${users_adm[@]}"; do
    sudo userdel -r "$user"
done

for user in "${users_ven[@]}"; do
    sudo userdel -r "$user"
done

for user in "${users_sec[@]}"; do
    sudo userdel -r "$user"
done

for grp in "${groups[@]}"; do
    sudo groupdel "$grp"
done

# Criando diretórios necessários para o desafio e definindo as devidas permissões
# - "/publico" deve poder ser acessado e usado por todos os usuários
# -  Os demais devem ser acessíveis e manipulados apenas pelo grupo:
#   - "/adm" pelo GRP_ADM
#   - "/ven" pelo GRP_VEN
#   - "/sec" pelo GRP_SEC

echo "🛠️ Criando diretorios..."

sudo mkdir -v /publico /adm /ven /sec


# Criando os grupos necessários para o desafio

echo "👨‍👩‍👧‍👦 Criando grupos... "

for grp in "${groups[@]}"; do
    sudo groupadd "$grp"
done

# Criando os usuários necessários para o desafio

echo "👤 Criando usuarios..."

for user in "${users_adm[@]}"; do
    sudo useradd -m -g "${groups[0]}" -s /bin/bash -c "Usuario do grupo de admin" -p $(openssl passwd -5 senha123) "$user"
done

for user in "${users_ven[@]}"; do
    sudo useradd -m -g "${groups[1]}" -s /bin/bash -c "Usuario do grupo de admin" -p $(openssl passwd -5 senha123) "$user"
done

for user in "${users_sec[@]}"; do
    sudo useradd -m -g "${groups[2]}" -s /bin/bash -c "Usuario do grupo de admin" -p $(openssl passwd -5 senha123) "$user"
done

# Mudando os proprietarios e grupos e atribuindo permissões

echo "Mudando proprietarios e grupos dos diretorios e atribuindo permissões ..."

sudo chown -v root /publico
sudo chown -v root:"${groups[0]}" /adm
sudo chown -v root:"${groups[1]}" /ven
sudo chown -v root:"${groups[2]}" /sec

sudo chmod 777 /publico
sudo chmod 770 /adm /ven /sec

echo "Finalizado!"
