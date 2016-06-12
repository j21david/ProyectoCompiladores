%{
FILE *archSal;

%}

%%

[0-9] 				fprintf(archSal,"Integer ",yytext);
[0-9]*"."[0-9]+			fprintf(archSal,"Float ",yytext);
"True"|"False"			fprintf(archSal,"Boolean ",yytext);
"if"			fprintf(archSal,"if ",yytext);
"else"			fprintf(archSal,"else ",yytext);
"while"			fprintf(archSal,"while ",yytext);
"int"			fprintf(archSal,"int ",yytext);
"String"		fprintf(archSal,"String ",yytext);
"Char "			fprintf(archSal,"Char ",yytext);
"void"    	fprintf(archSal,"void ",yytext);

[a-z]([a-z]|[0-9])* 		fprintf(archSal,"Identificador ",yytext);
"("				fprintf(archSal,"( ",yytext);
")"				fprintf(archSal,") ",yytext);
"{"				fprintf(archSal,"{ ",yytext);
"}"				fprintf(archSal,"} ",yytext);
"="				fprintf(archSal,"Operador ",yytext);
\n				fprintf(archSal,"\n",yytext);
";"				fprintf(archSal,"; ",yytext);



%%

main(int argc,char *argv[]){
    yyin=fopen(argv[1],"r");
    archSal=fopen("salida.txt","w");
    yylex();
    fclose(archSal);
 }
