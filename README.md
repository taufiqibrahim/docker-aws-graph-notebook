## Building Image
First, we build our image
```bash
docker build -t aws-graph-notebook . --no-cache
```

## Running using docker-compose
```bash
docker-compose up -d
```

## Copy notebooks from container to host
```bash
docker cp aws-graph-notebook_graph_notebook_1:/notebooks .
```
