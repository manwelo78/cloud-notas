#!/bin/bash
nombre="Manuel"
echo "Hola, $nombre"

for i in 1 2 3
do
  echo "Vuelta $i"
done

edad=25
if [ $edad -ge 18 ]
then
  echo "Eres mayor de edad"
else
  echo "Eres menor de edad"
fi
