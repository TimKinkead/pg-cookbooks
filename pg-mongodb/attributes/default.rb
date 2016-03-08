# default attributes for pg-mongodb recipes

default["mongodb"]["config"]["dbpath"] = "/srv/mongodb/data"
default["mongodb"]["config"]["logpath"] = "/srv/mongodb/logs/mongod.log"
default["mongodb"]["config"]["replSet"] = "rs0"