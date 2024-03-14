#!/bin/sh

#  FileManagerScript.sh
#  Traducciones
#
#  Created by Enrique on 14/3/24.
#  

# Definir los archivos de origen y destinos
archivos_origen=("es" "en" "ca" "eu-ES" "gl-ES" "it" "pt-BR" "pt-PT")

# Iterar sobre los archivos de origen y destinos
for (( i=0; i<${#archivos_origen[@]}; i++ )); do
    archivo_origen="${archivos_origen[$i]}.stringsdict"
    destino="${archivos_origen[$i]}.lproj/Localizable.stringsdict"
    
    # Verificar si el archivo origen existe
    if [ ! -f "$archivo_origen" ]; then
        echo "El archivo $archivo_origen no existe."
        continue
    fi
    
    # Copiar el archivo al destino con otro nombre
    cp -f "$archivo_origen" "$destino"
    
    # Verificar si la copia fue exitosa
    if [ $? -eq 0 ]; then
        echo "Se copió $archivo_origen a $destino"
    else
        echo "Error al copiar $archivo_origen a $destino."
    fi
done
