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
