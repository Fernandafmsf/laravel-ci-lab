FROM php:8.2-cli

WORKDIR /app

# 🔹 Build arguments (recebidos no build)
ARG APP_VERSION=dev
ARG APP_COMMIT=local
ARG APP_BUILD_DATE=local

# 🔹 Transformando ARG em ENV permanente na imagem
ENV APP_VERSION=${APP_VERSION}
ENV APP_COMMIT=${APP_COMMIT}
ENV APP_BUILD_DATE=${APP_BUILD_DATE}

COPY . .

RUN apt-get update && apt-get install -y \
    unzip \
    git \
    curl \
    && docker-php-ext-install pdo pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN composer install --no-dev --optimize-autoloader

EXPOSE 8000

CMD php artisan serve --host=0.0.0.0 --port=8000
