
local base = import './base.libsonnet';

base {
  components +: {
    devops6app +: {
       replicasFront: 3,
       replicasBack: 3,
       replicasDb: 3,
       imageFront: "murzinvit/frontend:latest",
       imageBack: "murzinvit/backend:latest",
       imageDb: "murzinvit/db:latest",
    },
  }
}
