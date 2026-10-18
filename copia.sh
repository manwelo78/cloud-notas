#!/bin/bash
origen=~/cloud
destino=~/copia_cloud
mkdir -p $destino
cp -r $origen/* $destino/
echo "Copia hecha en $destino"
ls $destino
