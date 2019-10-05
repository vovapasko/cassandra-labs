from cassandra import ConsistencyLevel
from cassandra.cluster import Cluster
from cassandra.query import SimpleStatement

cluster = Cluster(['127.0.0.1'])
connection = cluster.connect()
createFile = 'create.cql'
with open(createFile, mode='r') as f:
    lines = f.read()
    requests = lines.split(';')
    for request in requests:
        if request != '\n\n':
            formatted_request = request.strip()
            print(f"Executing {formatted_request}")
            query = SimpleStatement(formatted_request, consistency_level=ConsistencyLevel.ANY)
            connection.execute(query)
            print(f'{formatted_request} executed!')
print("Creating Done!")
cluster.shutdown()

cluster = Cluster()
connection = cluster.connect('labwork1')
workFile = 'work.cql'
with open(workFile, mode='r') as f:
    lines = f.read()
    requests = lines.split(';')
    for request in requests:
        if request != '':
            formatted_request = request.strip()
            print(f"Executing {formatted_request}")
            query = SimpleStatement(formatted_request, consistency_level=ConsistencyLevel.ONE)
            connection.execute(query)
            print(f'{formatted_request} executed!')
print("Editing Done!")
cluster.shutdown()

cluster = Cluster()
connection = cluster.connect('labwork1')
dropFile = 'drop.cql'
with open(dropFile, mode='r') as f:
    lines = f.read()
    requests = lines.split(';')
    for request in requests:
        if request != '\n':
            formatted_request = request.strip()
            print(f"Executing {formatted_request}")
            query = SimpleStatement(formatted_request, consistency_level=ConsistencyLevel.ALL)
            connection.execute(query)
            print(f'{formatted_request} executed!')
print("Deleting Done!")
cluster.shutdown()
