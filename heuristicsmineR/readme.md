# heuristicsmineR Docker Image with CLI

## Build

```
docker build -t bupaverse/heuristicsminer-cli:latest .
```

## Run

## CLI usage help

```
# Windows
docker run -v %cd%:/work bupaverse/heuristicsminer-cli:latest cli.R --help

# Linux
docker run -v $(pwd):/work bupaverse/heuristicsminer-cli:latest cli.R --help
```

## Discover Causal net from CSV

```
# Windows
docker run -v %cd%:/work bupaverse/heuristicsminer-cli:latest cli.R test.csv test.svg --input-format csv

# Linux
docker run -v $(pwd):/work bupaverse/heuristicsminer-cli:latest cli.R test.csv test.svg --input-format csv
```

## Known issues¨

* V8 package is currently showing the following error  `<unknown>:1753848: Invalid asm.js: Function definition doesn't match use`