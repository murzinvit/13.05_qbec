{
  components: { // required
    devops6app: {
       replicasFront: 1,
       replicasBack: 1,
       replicasDb: 1,
       imageFront: "murzinvit/frontend:latest",
    },
  },
}
