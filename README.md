## Домашнее задание к занятию "13.5 поддержка нескольких окружений на примере Qbec"
Приложение обычно существует в нескольких окружениях. Для удобства работы следует использовать соответствующие инструменты, например, Qbec.

### Задание 1: подготовить приложение для работы через qbec
Приложение следует упаковать в qbec. Окружения должно быть 2: stage и production. 

Требования:
* stage окружение должно поднимать каждый компонент приложения в одном экземпляре;
* production окружение — каждый компонент в трёх экземплярах;
* для production окружения нужно добавить endpoint на внешний адрес.
---




### working notes: </br>
Установка qbec:
Скачать [qbec](https://github.com/splunk/qbec/releases), распаковать и переместить в /usr/local/bin </br>
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
