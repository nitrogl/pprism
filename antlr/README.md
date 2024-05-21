# Parse PRISM and SPRISM files

We use python (but others should work well).

## Grammars

They are split into lexer and parser grammars for clarity.
We have two pairs: `PrismLexer.g4`, `PrismParser.g4`, and `PPrismLexer.g4`, `PPrismParser.g4`.

### Dependencies

Simply, `antlr4` and `python3-antlr4`. <- these are the linux packages not python packages

## Running/testing

This is in two parts, first we generate the parser, then we parse a source code.

### Generate parsers

To generate the python parser from the grammars:

```
antlr4 -Dlanguage=Python3 PrismLexer.g4
antlr4 -Dlanguage=Python3 PrismParser.g4
```

and

```
antlr4 -Dlanguage=Python3 PPrismLexer.g4
antlr4 -Dlanguage=Python3 PPrismParser.g4
```

### Parse source code

To parse source code we use `pygrun`.
An example is

```
pygrun Prism prismModel <source-code.prism>
```

and 

```
pygrun PPrism parameterisedPrismModel <source-code.prism>
```
