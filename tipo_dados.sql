##Tipo Texto
* **CHAR(tamanho)** : Comprimento fixo.Guarda um número fixo de caracteres. Pode conter letras, números e caractestes
especiais.Guarda até 255 caracteres.

* **VARCHAR(tamanho)** : Comprimento variável.Mesmas caracteristicas do CHAR. Se criar com mais de 255 caracteres, ele
transforma para o tipo Text.

* **TEXT **: Guarda uma string com o tamanho máximo de 65.535.

* **BLOB **: Tipo de dado medido pela quantidade de bytes. Pode salvar arquivos com o máximo de 655338.

##Tipo númerico
* **TINYINT **: Suporta de -128 até 127 caracteres.

* **SMALLINT **: Suporta de -32768 até 32667 caracteres.

* **MEDIUMINT **: Suporta de -8388608 até 8388607 caracteres.

* **INT(tamanho) **: Suporta de -2147483648 até 2147483647 caracteres.

* **BIGINT **: Suporta de -9223372036854775808 até 9223372036854775807 caracteres.

* **FLOAT(tamanho, decimal) **: Guarda números reais. O número máximo de caracteres pode ser especificado entre 
parênteses.

* **DOUBLE(tamanho, decimal) **: Guarda números reais. O número máximo de caracteres pode ser especificado entre 
parênteses. Armazena uma quantidade maior de números do que o tipo FLOAT.   

##Tipo date/time

* **DATE() **:Tipo de campo que vai armazenar datas no formato: YYYY-MM-DD, onde Y refere-se ao ano, M ao mês e 
D ao dia.

* **DATETIME() **: Combinação de data e tempo. Formato:YYYY-MM-DD HH:MI:SS.

* **TIME() **: Armazena horas, minutos e segundos no formato HH:MI:SS.

