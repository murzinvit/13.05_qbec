[
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
]