## Домашнее задание к занятию "13.5 поддержка нескольких окружений на примере Qbec"
Приложение обычно существует в нескольких окружениях. Для удобства работы следует использовать соответствующие инструменты, например, Qbec.

### Задание 1: подготовить приложение для работы через qbec
Приложение следует упаковать в qbec. Окружения должно быть 2: stage и production. 

Требования:
* stage окружение должно поднимать каждый компонент приложения в одном экземпляре;
* production окружение — каждый компонент в трёх экземплярах;
* для production окружения нужно добавить endpoint на внешний адрес.
---
Установка qbec: </br>
Скачать [qbec](https://github.com/splunk/qbec/releases), распаковать и переместить в /usr/local/bin </br>
Приложение для qbec: [qbec-dev6app](https://github.com/murzinvit/13.05_qbec/tree/main/qbec-dev6app) </br>
Json для stage окружения: [devops6app.jsonnet](https://github.com/murzinvit/13.05_qbec/blob/e9e293106be908117a9408cf6b9ee7f5dd847261/devops6app.jsonnet) </br>
Создать namespace - `kubectl create ns stage` </br>
Запуск в stage окружении: `qbec apply stage` </br>
![qbec_stage](https://github.com/murzinvit/screen_1/blob/e47544d20c5b1b4c24056b8e65312fd8ed3f65d2/Kubec_qbec_stage.jpg) </br>
Создать namespace - `kubectl create ns prod` </br>
Для запуска в stage окружении переместить соответствующий devops6app.jsonnet в папку - components </br>
Выполнить команду: `qbec apply prod` </br>
Json для prod окружения с внешним endpoint: [devops6app.jsonnet](https://github.com/murzinvit/13.05_qbec/blob/e9e293106be908117a9408cf6b9ee7f5dd847261/qbec-dev6app/components/devops6app.jsonnet) </br>
![qbec_prod](https://github.com/murzinvit/screen_1/blob/236d083a9461aed2e200e270b7e2813bf405e7e9/Kuber_qbec_prod.jpg) </br>
Доступ из браузера: </br>
![stage_web](https://github.com/murzinvit/screen_1/blob/15f4b6e9183653b60e6be508d0714e0aa78be46d/Kuber_qbec_stage_web.jpg) </br>

---
### working notes: </br>

https://harsimranmaan.medium.com/qbec-the-deployment-tool-for-multiple-kubernetes-environments-c39b6bd7ea07 </br>
https://github.com/aak74/kubernetes-for-beginners/tree/master/deploy/qbec </br>
https://qbec.io/userguide/usage/authoring/ </br>
https://www.convertjson.com/yaml-to-json.htm </br>
`qbec show default`  </br>
`qbec version` </br>
`qbec env list` </br>
`qbec init - Initializing a qbec application` </br>
`qbec init --with-example my-app` </br>
`qbec component list default` </br>
`qbec param list default` </br>
`qbec validate default` </br>
![Schem](https://github.com/murzinvit/screen_1/blob/e73e4d0b12baaf9c27ff8c77f0bd0857390eed61/Schem.jpg) 
