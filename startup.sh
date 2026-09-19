#!/bin/bash

echo "=========================================="
echo "Iniciando Bingo Multicanal"
echo "=========================================="

# Asegurar permisos de ejecución
chmod +x startup.sh

# ============================================================
# ARCHIVOS ESTÁTICOS
# ============================================================

echo "📦 Recolectando archivos estáticos..."

python manage.py collectstatic --noinput


# ============================================================
# MIGRACIONES
# ============================================================

echo "🗄️ Ejecutando migraciones..."

python manage.py migrate --noinput


# ============================================================
# CREAR SUPERUSUARIO
# ============================================================

echo "👤 Verificando superusuario..."

python manage.py shell << 'EOF'

import os

from django.contrib.auth import get_user_model


User = get_user_model()


username = os.environ.get(
    'DJANGO_SUPERUSER_USERNAME',
    'admin'
)

email = os.environ.get(
    'DJANGO_SUPERUSER_EMAIL',
    'admin@bingo.com'
)

password = os.environ.get(
    'DJANGO_SUPERUSER_PASSWORD'
)


if User.objects.filter(username=username).exists():

    print("✅ Superusuario ya existe")

elif password:

    User.objects.create_superuser(
        username,
        email,
        password
    )

    print("✅ Superusuario creado")

else:

    print(
        "⚠️ DJANGO_SUPERUSER_PASSWORD "
        "no está configurada"
    )

EOF


# ============================================================
# INICIAR DAPHNE
# ============================================================

echo "=========================================="
echo "🚀 Iniciando Daphne..."
echo "=========================================="


exec daphne \
    -b 0.0.0.0 \
    -p 8000 \
    proyecto.asgi:application