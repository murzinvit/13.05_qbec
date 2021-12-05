
local p = import '../params.libsonnet';
local params = p.components.devops6app;

[
{
   "apiVersion": "apps/v1",
   "kind": "Deployment",
   "metadata": {
      "name": "frontend",
      "labels": {
         "name": "frontend"
      }
   },
   "spec": {
      "replicas": params.replicasFront,
      "selector": {
         "matchLabels": {
            "name": "frontend"
         }
      },
      "template": {
         "metadata": {
            "labels": {
               "name": "frontend"
            }
         },
         "spec": {
            "containers": [
               {
                  "name": "fronend",
                  "image": params.imageFront,
                  "imagePullPolicy": "IfNotPresent",
                  "ports": [
                     {
                        "containerPort": 80
                     }
                  ],
                  "env": [
                     {
                        "name": "BASE_URL",
                        "value": "http://localhost:9000"
                     }
                  ]
               }
            ]
         }
      }
   }
},
{
   "apiVersion": "apps/v1",
   "kind": "Deployment",
   "metadata": {
      "name": "backend",
      "labels": {
         "name": "backend"
      }
   },
   "spec": {
      "replicas": params.replicasBack,
      "selector": {
         "matchLabels": {
            "name": "backend"
         }
      },
      "template": {
         "metadata": {
            "labels": {
               "name": "backend"
            }
         },
         "spec": {
            "containers": [
               {
                  "name": "backend",
                  "image": params.imageBack,
                  "imagePullPolicy": "IfNotPresent",
                  "ports": [
                     {
                        "containerPort": 9000
                     }
                  ],
                  "env": [
                     {
                        "name": "DATABASE_URL",
                        "value": "postgres://postgres:postgres@db-service:5432/news"
                     }
                  ]
               }
            ]
         }
      }
   }
},
{
   "apiVersion": "apps/v1",
   "kind": "Deployment",
   "metadata": {
      "name": "db",
      "labels": {
         "name": "db"
      }
   },
   "spec": {
      "replicas": params.replicasDb,
      "selector": {
         "matchLabels": {
            "name": "db"
         }
      },
      "template": {
         "metadata": {
            "labels": {
               "name": "db"
            }
         },
         "spec": {
            "containers": [
               {
                  "name": "db",
                  "image": params.imageDb,
                  "imagePullPolicy": "IfNotPresent",
                  "ports": [
                     {
                        "containerPort": 5432
                     }
                  ],
                  "volumeMounts": [
                     {
                        "name": "db-storage",
                        "mountPath": "/var/lib/"
                     }
                  ]
               }
            ],
            "volumes": [
               {
                  "name": "db-storage",
                  "emptyDir": {}
               }
            ]
         }
      }
   }
},
{
   "apiVersion": "v1",
   "kind": "Service",
   "metadata": {
      "name": "backend-service",
      "labels": {
         "name": "backend-service"
      }
   },
   "spec": {
      "ports": [
         {
            "port": 9000
         }
      ],
      "selector": {
         "name": "backend"
      },
      "type": "ClusterIP"
   }
},
{
   "apiVersion": "v1",
   "kind": "Service",
   "metadata": {
      "name": "db-service",
      "labels": {
         "name": "db-service"
      }
   },
   "spec": {
      "ports": [
         {
            "port": 5432
         }
      ],
      "selector": {
         "name": "db"
      },
      "type": "ClusterIP"
   }
},
{
   "apiVersion": "v1",
   "kind": "Service",
   "metadata": {
      "name": "frontend-service",
      "labels": {
         "name": "frontend-service"
      }
   },
   "spec": {
      "ports": [
         {
            "port": 80
         }
      ],
      "selector": {
         "name": "frontend"
      },
      "type": "ClusterIP"
   }
},
{
   "apiVersion": "networking.k8s.io/v1",
   "kind": "Ingress",
   "metadata": {
      "name": "ingress-hosts"
   },
   "spec": {
      "rules": [
         {
            "host": "devops6.ru",
            "http": {
               "paths": [
                  {
                     "path": "/",
                     "pathType": "Prefix",
                     "backend": {
                        "service": {
                           "name": "frontend-service",
                           "port": {
                              "number": 80
                           }
                        }
                     }
                  }
               ]
            }
         }
      ]
   }
},
]