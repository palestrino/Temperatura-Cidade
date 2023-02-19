#!/bin/bash

# Insira sua chave de API do OpenWeatherMap aqui
api_key="insira sua chave api"

# Insira o nome da cidade que você deseja verificar a temperatura e pluviosidade
cidade="Nome da cidade"

# Faz uma solicitação HTTP para a API do OpenWeatherMap e salva a resposta em um arquivo temporário
curl -s "http://api.openweathermap.org/data/2.5/weather?q=${cidade}&appid=${api_key}&lang=pt_br&units=metric" -o /tmp/weather.json

# Extrai a temperatura em Celsius da resposta usando o utilitário jq
temperatura=$(jq -r '.main.temp' /tmp/weather.json)

# Extrai a pluviosidade da resposta usando o utilitário jq
pluviosidade=$(jq -r '.weather[0].description' /tmp/weather.json)

# Exibe a temperatura e a pluviosidade em português
echo "A temperatura em ${cidade} é de ${temperatura} °C."
echo "Atualmente, a pluviosidade está em ${pluviosidade}."
