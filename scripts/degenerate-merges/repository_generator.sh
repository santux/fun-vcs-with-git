#!/bin/sh

# 1. Definir el nombre del directorio (argumento o default)
NOMBRE_DIR=${1:-"proyecto_default"}
RUTA_DESTINO="$HOME/$NOMBRE_DIR"

# 2. Configuracion del idioma git (Ingles)
alias git='LC_ALL=en_US git'

# 3. Crear el directorio si no existe
if [ ! -d "$RUTA_DESTINO" ]; then
    echo "Creando directorio en: $RUTA_DESTINO"
    mkdir -p "$RUTA_DESTINO"
else
    echo "El directorio ya existe."
fi

# 4. Ingresar al directorio
cd "$RUTA_DESTINO" || { echo "Error: No se pudo acceder a $RUTA_DESTINO"; exit 1; }

# 5. Inicializar Git si no existe un repositorio (.git)
# Usamos 'git rev-parse' para detectar si ya estamos dentro de un repo
if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Ya existe un repositorio Git en esta ubicación."
else
    echo "Inicializando nuevo repositorio Git..."
    git init

# 6. Creacion de commits de ejemplo
    echo '= Documentacion' > README.adoc
    git add README.adoc
    git commit -m 'Commit inicial'
    echo -e "\n== Commit uno main" >> README.adoc
    git commit README.adoc -m 'Cambio uno main'
    git checkout -b rama-a
    echo -e "\n== Cambio uno rama-a" >> README.adoc
    git commit README.adoc -m 'Cambio uno rama-a'
    echo -e "\n== Cambio dos rama-a" >> README.adoc
    git commit README.adoc -m 'Cambio dos rama-a'
    git checkout main
    git merge rama-a
    git merge rama-a
fi

echo "Listo. Te encuentras en: $(pwd)"

