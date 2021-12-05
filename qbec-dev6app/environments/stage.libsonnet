local base = import './base.libsonnet';

base {
  components +: {
    devops6app +: {
       replicasFront: 2,
       replicasBack: 2,
       replicasDb: 2,
       imageFront: "murzinvit/frontend:latest",
       imageBack: "murzinvit/backend:latest",
       imageDb: "murzinvit/db:latest",
    },
  }
}
