#!/bin/bash
#
# Rutas
input_file=$1 

# Recibe el archivo como argumento 
temp_file="${input_file}.tmp" 
# Archivo temporal para evitar conflictos

# Número de líneas totales del archivo

total_lines=$(wc -l < "$input_file")

# 10% de las líneas totales

lines_to_cut=$((total_lines / 10))

# Cortar el 10% del archivo y guardarlo temporalmente

head -n "$lines_to_cut" "$input_file" > "$temp_file"

# Reemplazar el archivo original con el archivo temporal

mv "$temp_file" "$input_file"
echo "Corte realizado para $input_file."
