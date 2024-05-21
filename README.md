# pprism
Parametrized PRISM

---
`pprism` is a small project that provides a sound extension to the language of [PRISM model-checker](https://www.prismmodelchecker.org/) to allow for in-language parametrized constant.


## Build

**We will soon distribute it conveniently as a package**



### Requirements

Requirements: `antlr4`, `python3-antlr4` (from apt in Debian/Ubuntu derived distros)

### Parser

You need to generate the parser first:

```bash
antlr4 -Dlanguage=Python3 PrismLexer.g4
antlr4 -Dlanguage=Python3 PrismParser.g4
```

and

```bash
antlr4 -Dlanguage=Python3 PPrismLexer.g4
antlr4 -Dlanguage=Python3 PPrismParser.g4
```

## Run

After the build is successful, you can start `pprism` from its directory.



## Pros'n'Cons

### Pros

- Your model in as few as 1 file (you need not to use *experiments*, `prism-auto`, or spread your model across custom scripts)
- Sound translation to non-parametrized PRISM
- You can call pprism instead of prism transparently



### Cons

- Not parallelised yet
- Setup is required
