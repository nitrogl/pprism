/**
 * Copyright (C) 2024  Roberto Metere, York, UK
 * All rights reserved.
 *
 * Redistribution and use of this script, with or without modification, is
 * permitted provided that the following conditions are met:
 *
 * 1. Redistributions of this script must retain the above copyright
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
parser grammar PrismParser;

options {
    tokenVocab = PrismLexer;
}

// Start rule
prismModel: modelType? (constDeclaration|GLOBAL stateDeclaration)* moduleDeclaration* labelDeclaration*;

// Model type declaration
modelType: CTMC | DTMC | MDP;

// Const declaration
constDeclaration: CONSTANT TYPE_FLOAT? ID EQUALS expression SEMICOLON;

// Module declaration
moduleDeclaration: MODULE ID (LPAREN parameterDeclaration (COMMA parameterDeclaration)* RPAREN)? moduleElement* ENDMODULE;

parameterDeclaration: ID COLON (INT | FLOAT | ID);

moduleElement:
      initDeclaration
    | rewardsDeclaration
    | rewardsStructDeclaration
    | formulaDeclaration
    | labelDeclaration
    | stateDeclaration
    | transition;

// State declaration
stateDeclaration: ID COLON LBRACK ((INTRANGE)|(expression RANGE)) (INT | ID | expression) RBRACK initDeclaration SEMICOLON;

// Initial state declaration
initDeclaration: INIT (ID | INT | FLOAT);

// Rewards declaration
rewardsDeclaration: REWARDS ID (LPAREN ID (COMMA ID)* RPAREN)? LBRACE rewardsElement* RBRACE;

rewardsElement: ID EQUALS expression SEMICOLON;

// Rewards struct declaration
rewardsStructDeclaration: REWARDS_STRUCT ID LBRACE rewardsStructElement* RBRACE;

rewardsStructElement: ID COLON expression SEMICOLON;

// Formula declaration
formulaDeclaration: FORMULA ID EQUALS expression SEMICOLON;

// Label declaration
labelDeclaration: LABEL (ID|STRING) EQUALS expression SEMICOLON;

// Transition
hypotheses: LBRACK expression? (COMMA expression)* RBRACK;

transition: hypotheses? expression TRANSITION expression COLON expression SEMICOLON;

transitionElement: ID EQUALS expression SEMICOLON;

// State reference
stateReference: ID;

// Expression
expression: expression (
          EQUALS
        | NOT_EQUALS
        | LESS_THAN
        | LESS_THAN_OR_EQUAL
        | GREATER_THAN
        | GREATER_THAN_OR_EQUAL
        | PLUS
        | MINUS
        | MULTIPLY
        | DIVIDE
        | AND
        | OR
        ) expression
    | (MINUS | NOT) expression
    | atom;

atom: INT
    | FLOAT
    | TRUE
    | FALSE
    | ID
    | LPAREN expression RPAREN;
