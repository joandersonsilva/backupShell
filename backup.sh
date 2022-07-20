#!/usr/bin/env bash
#
# backup.sh - Realiza backup do /home/"USUARIO"
#
# Site:       https://github.com/joandersonsilva
# Instagram:  https://instagram.com/joanderson.sh
# LinkedIn:   https://linkedin.com/in/JoandersonFSilva
# Email:      joandersonsilva222@gmail.com
# Autor:      Joanderson Silva
# Manutenção: Joanderson Silva
#
# ------------------------------------------------------------------------ #
#  Este programa irá fazer backup da pasta do usuário /home para uma midia externa
# previamente montada
#
#  Exemplos:
#      $ ./backupShell.sh
#      Neste exemplo o script será executado e fará o backup
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 29/06/2022, Joanderson:
#       - Início do programa, feito a apresentação, adicionado as variaveis e verificação 
#           da midia externa. Erro "função stat falhou"
#   v1.1 17/07/2022, Joanderson:
#       - Erro na versão anterior corrigido, teste de backup realizado e 
#           concluido com sucesso
#   v1.2 19/07/2022, Joanderson
#       - Listagem e seleção de dispositivos externos para backup.
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 5.1.4
# ------------------------------------------------------------------------ #
# Agradecimentos:
#
# 	Ao meu irmão https://github.com/jaedsonpys que me ajudou com git e solução
# com um (if)
#	  
# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #
USER="$(whoami)"
OPCAO=
MEDIA=

EXTERNAL_STORAGE="/media/$USER"

DATE=$(date "+%d-%m-%Y")
ARCHIVE="backup-$USER-$DATE.tar.gz"

COR_ERRO="\033[31;1m"
COR_OK="\033[32;1m"
COR="\033[35;1m"
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #

echo -e "Dispositivos conectados: " "$(ls /media/"$USER")" 

echo -n "Digite o nome do dispositivo para realizar o backup: "
read MEDIA

echo -e "Disposito escolhido foi: ${COR}"$MEDIA""

echo -e -n "\033[37;1mDeseja realizar o backup do /home/$USER para $EXTERNAL_STORAGE/$MEDIA ? s(SIM) / n(NAO) "
read OPCAO

[ "$OPCAO" = "s" ] && echo "$(tar -cvzf "$EXTERNAL_STORAGE/$MPD-8GBEDIA/$ARCHIVE" /home/$USER)"
[ "$OPCAO" = "n" ] && echo "BACKUP CANCELADO" && exit 1


echo -e "${COR_OK} Backup $ARCHIVE feito com sucesso"
# ------------------------------------------------------------------------- #

