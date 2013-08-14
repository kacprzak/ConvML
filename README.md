ConvML
======

Znacznikowy język opisu konfiguracji przenośników taśmowych.

Wersja: 1.1 (rozwojowa)


Pliki i katalogi w repozytorium
-------------------------------

* beltconv.xsd - wersja 1.0 ConvML'a (stabilna).
* convml_10_template.xml - najprostszy plik w ConvML'a 1.0 (minimalny szablon).
* convml_11.xsd - wersja 1.2 ConvML'a (developerska).
* convml_11_template.xml - minimalny szablon dla wersji ConvML 1.2.
* convml_11.sch - schema w fomacie Schematron wykonująca dodatkową walidację
  reguł niemożliwych do sprawdzenia za pomocą XML Schema.

* docs - opisowa dokumentacja języka ConvML.
* xslt - szablony transformacji w języku XSLT.
* translations - tłumaczenia elementów i atrybutów.
* test - dokumenty wykorzystywane do testowania schemy.
* thirdparty - narzędzia autorów trzecich.
* tools - narzędzia/skrypty pomocne podczas pracy z ConvML.


Przyjęte konwencje
------------------

### Wersjonowanie

Od wersji 1.1 pliki ze schemą nazywane są convml_WERSJABEZKROPKI.xsd. Numery
wersji zakończone liczbą nieparzystą oznaczają wersje rozwojowe, a zakończone
liczbą parzystą wersje stabilne.

### Nazwy elementów i atrybutów

Nazwy elementów zapisywane są za pomocą tzw. *Camel Case* oraz pierwszy znak jest
zapisywany wielką literą. Nazwy atrybutów zapisywane są również przy użyciu
*Camel Case* ale zaczynają się małą literą.

### XSD

Schemę zorganizowano według wzorca projektowego "Venetian Blind" opisanego na
stronie [xFront](http://www.xfront.com/GlobalVersusLocal.html). Wyjątkiem jest
jedynie element *Meta* gdzie świadomie zrezygnowano z tego wzorca.

Grupy atrybutów mają dodany do nazwy dodany sufiks *AttrGroup*. Do nazwy typów
dodawany jest sufiks *Type*.

### Referencje

Wewnątrz instancji dokumentu mogą być utrzymywane relacje pomiędzy elementami
które nie znajdują się w bezpośrednim sąsiedztwie.

Przykładowo element *Material* za pomocą atrybutu *type* może wskazywać na
element *MaterialType*, którego wartość atrybutu *typeId* zgadza się z
wartością atrybutu *type* elementu odwołującego się.

Do modelowania takich powiązań wykorzystano technikę `key/keyref` będącą częścią
standardu XML Schema.


Tłumaczenia
-----------

W katalogu translations znajdują się opisy elementów i atrybutów języka ConvML
przeznaczone do wykorzystania w interfejsie użytkownika aplikacji wykorzystującej
ten język. Są to pliki:

* attribute.properties - dla atrybutów
* element.properties - dla elementów

Plik są zgodne z formatem *Java properties*.

Uwaga! Pliki te najlepiej edytować dedykowanym edytorem ponieważ są one kodowane
za pomocą ISO-8859-1. Znaki UNICODE są zapisywane za pomocą sekwencji \uHHHH,
gdzie HHHH to hexadecymalny kod znaku UNICODE. Edytor programu NetBeans ukrywa
ten szczegół przed użytkownikiem co znacznie ułatwia pracę.


XSLT
----

W katalogu xslt znajduje się szablon transformacji convml_update_10to12.xslt,
który służy do transformacji dokumentów ConvML 1.0 do ConvML 1.2.


Testy
-----

Polecenie:

    $ rake test
    
uruchamia sprawdzanie poprawności dokumentów znajdujących się w katalogu `test`.
Dokumenty w tym katalogu, których nazwa kończy się sufiksem *Fail*, nie powinny
przejść walidacji pozytywnie. W razie negatywnego wyniku walidacji któregoś z
dokumentów (lub pozytywnego dla dokumentów zawierających błędy) procedura
testowa wyświetli ostrzeżenie.

Do uruchomienia testów wymagana jest obecność w systemie:

* języka Ruby 1.9
* biblioteki Nokogiri
* JavaVM 1.5

Instalator języka Ruby dla systemu Windows jest dostępny na stronie
[rubyinstaller.org](http://rubyinstaller.org/). Po instalacji wymagane jest
jeszcze doinstalowanie biblioteki Nokogiri przy pomocy polecenia:

    c:\>gem install nokogiri
