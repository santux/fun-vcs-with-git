#!/bin/sh

# Configuración inicial
> demo.txt
# Asegúrate de que el archivo python se llame app.py (o cámbialo aquí)
PYTHON_FILE="hola_mundo.py"

echo -n "Introduce un número entero: "
read veces

# Validar entrada
if [[ ! "$veces" =~ ^[0-9]+$ ]]; then
    echo "Error: Por favor introduce un número entero válido."
    exit 1
fi

# Elegir una iteración aleatoria para inyectar el error
iteracion_error=$(( ( RANDOM % veces ) + 1 ))
echo "El error se inyectará silenciosamente en la iteración: $iteracion_error"

for ((i=1; i<=veces; i++))
do
    # 1. Escribir en el txt
    echo "Iteracion No. $i" >> demo.txt
    git add demo.txt

    # 2. Verificar si toca inyectar el error en esta iteración
    if [ $i -eq $iteracion_error ]; then
        # Descomenta la línea del raise TypeError en el archivo python
        sed -i 's/#raise TypeError("Que alguien me ayude")/raise TypeError("Que alguien me ayude")/' "$PYTHON_FILE"
        git add "$PYTHON_FILE"
        mensaje="inyectando error"
    else
        mensaje="Commit numero $i"
    fi

    # 3. Hacer el commit
    git commit -m "$mensaje"
done

echo "Proceso terminado. Se crearon $veces commits y el error está en el historial."
