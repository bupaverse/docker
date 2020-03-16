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

## Discovery

### Discover Causal net from CSV

As SVG:
```
# Windows
docker run -v %cd%:/work bupaverse/heuristicsminer-cli:latest cli.R test.csv test.svg --input-format csv

# Linux
docker run -v $(pwd):/work bupaverse/heuristicsminer-cli:latest cli.R test.csv test.svg --input-format csv
```

As DOT:
```
# Windows
docker run -v %cd%:/work bupaverse/heuristicsminer-cli:latest cli.R test.csv test.dot --input-format csv --output-format dot

# Linux
docker run -v $(pwd):/work bupaverse/heuristicsminer-cli:latest cli.R test.csv test.dot --input-format csv --output-format dot
```

### Discover Petri net from CSV

As SVG:
```
# Windows
docker run -v %cd%:/work bupaverse/heuristicsminer-cli:latest cli.R test.csv test.svg --input-format csv --output-type pnet

# Linux
docker run -v $(pwd):/work bupaverse/heuristicsminer-cli:latest cli.R test.csv test.svg --input-format csv  --output-type pnet
```

## Known issues¨

* V8 package is currently showing the following error  `<unknown>:1753848: Invalid asm.js: Function definition doesn't match use`