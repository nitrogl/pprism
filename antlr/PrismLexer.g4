/**
 * Copyright (C) 2024  Roberto Metere, York, UK
 * All rights reserved.
 *
 * Redistribution and use of this script, with or without modification, is
 * permitted provided that the following conditions are met:
 *
 *    Redistributions of this script must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
 *  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
 *  EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 *  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 *  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 *  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 *  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 *  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
lexer grammar PrismLexer;

// Keywords
DEFINE: 'define';
MODULE: 'module';
ENDMODULE: 'endmodule';
REWARDS: 'rewards';
CONSTANT: 'const';
GLOBAL: 'global';
CTMC: 'ctmc';
DTMC: 'dtmc';
MDP: 'mdp';
REWARDS_STRUCT: 'rewards_struct';
FORMULA: 'formula';
PROPERTY: 'property';
LABEL: 'label';
INIT: 'init';

// Types
TYPE_INT: 'int';
TYPE_FLOAT: 'double';

// Operators
EQUALS: '=';
PLUS: '+';
MINUS: '-';
MULTIPLY: '*';
DIVIDE: '/';
MODULO: '%';
NOT_EQUALS: '!=';
LESS_THAN: '<';
LESS_THAN_OR_EQUAL: '<=';
GREATER_THAN: '>';
GREATER_THAN_OR_EQUAL: '>=';
AND: '&';
OR: '||';
NOT: '!';
TRANSITION: '->';

// Delimiters
LPAREN: '(';
RPAREN: ')';
LBRACE: '{';
RBRACE: '}';
LBRACK: '[';
RBRACK: ']';
SEMICOLON: ';';
COLON: ':';
COMMA: ',';
RANGE: '..';
DOT: '.';

// Identifiers
ID: [a-zA-Z_] [a-zA-Z0-9_]* [']*;
STRING: '"' ID '"';

// Numerical literals
TRUE: 'true';
FALSE: 'false';
INT: [0-9]+;
INTRANGE: INT RANGE;
FLOAT: [0-9]+ DOT [0-9]*;

// Whitespace and comments
WS: [ \t\r\n]+ -> skip;
COMMENT: '//' ~[\r\n]* -> skip;
