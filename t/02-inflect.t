#!perl -T

use utf8;
use Test::More 'no_plan';

use Lingua::RU::Inflect ':all';

*f = \&Lingua::RU::Inflect::inflect_given_name;

# Masculine names
ok( join(' ', f( NOMINATIVE, 'Пупкин', 'Василий', 'Алибабаевич' ))
    eq 'Пупкин Василий Алибабаевич',
    'Nominative of any name must be same as name' );
ok( join(' ', f( GENITIVE, 'Иванов', 'Сергей', 'Михайлович' ))
    eq 'Иванова Сергея Михайловича',
    'Genitive of usual russian masculine name: Sergey Mikhailovich Ivanov' );
ok( join(' ', f( DATIVE, 'Ильин', 'Роман' ))
    eq 'Ильину Роману ',
    'Dative of usual russian masculine name without patronym: Roman Ilyin' );
ok( join(' ', f( DATIVE, 'Ильиных', 'Роман' ))
    eq 'Ильиных Роману ',
    'Dative of russian masculine name with undeclinable lastname and without patronym: Roman Ilyinykh' );
ok( join(' ', f( DATIVE, 'Кох', 'Роман' ))
    eq 'Коху Роману ',
    'Dative of russian masculine name with declinable foreign lastname and without patronym: Roman Koch' );
ok( join(' ', f( ACCUSATIVE, undef, undef, 'Михалыч' ))
    eq '  Михалыча',
    'Accusative of vulgar form of russian patronym: Mikhalych' );
ok( join(' ', f( INSTRUMENTAL, 'Пушкин', undef, 'Сергеич' ))
    eq 'Пушкиным  Сергеичем',
    'Instrumental case of lastname with vulgar form of patronym: Pushkin Sergeich' );
ok( join(' ', f( INSTRUMENTAL, 'Чайковский', 'Пётр', 'Ильич' ))
    eq 'Чайковским Петром Ильичом',
    'Instrumental case of special firstname (yo -> e) and patronym: Tchaikovsky Pyotr Ilyich' );
ok( join(' ', f( PREPOSITIONAL, 'Репка', 'Илья' ))
    eq 'Репке Илье ',
    'Prepositional case of masculine name ends to vowels without patronym: Ilya Repka' );
ok( join(' ', f( GENITIVE, 'Водка', 'Кузьма' ))
    eq 'Водки Кузьмы ',
    'Genitive case of masculine name ends to vowels without patronym: Kuzma Vodka' );
ok( join(' ', f( DATIVE, 'Стремя', 'Имя', 'Петрович' ))
    eq 'Стремени Имени Петровичу',
    'Dative case of common nouns ends to -mya with masculine patronym: Imya Petrovich Stremya' );
ok( join(' ', f( GENITIVE, 'Ушко', 'Микола' ))
    eq 'Ушко Миколы ',
    'Genitive of ukrainian masculine name ends to vowels without patronym: Mykola Ushko' );
ok( join(' ', f( DATIVE, 'Косой', 'Вася' ))
    eq 'Косому Васе ',
    'Dative of name of boy ends to vowels without patronym: Vasya Kosoy' );
ok( join(' ', f( ACCUSATIVE, 'Балаганов', 'Шура' ))
    eq 'Балаганова Шуру ',
    'Accusative of ambiguous name, whose gender detected by lastname: Shura Balaganov' );
ok( join(' ', f( INSTRUMENTAL, 'Уолл', 'Ларри' ))
    eq 'Уоллом Ларри ',
    'Instrumental case of english masculine name: Larry Wall' );
ok( join(' ', f( DATIVE, 'Христос', 'Иисус' ))
    eq 'Христу Иисусу ',
    'Dative case of exception: Jesus Christ' );

# Fluent vowels: Pavel → Pavla, Lev → Lva, Konets → Kontsa etc
ok( join(' ', f( GENITIVE, 'Конец', 'Павел' ))
    eq 'Конца Павла ',
    'Genitive case of names with fluent vowels: Pavel Konets' );
ok( join(' ', f( GENITIVE, 'Конец', 'Яна' ))
    eq 'Конец Яны ',
    'Genitive case of feminine names with fluent vowels: Yana Konets' );
ok( join(' ', f( GENITIVE, 'Жнец', 'Павел' ))
    eq 'Жнеца Павла ',
    'Genitive case of names with fluent vowels: Pavel Zhnets' );
ok( join(' ', f( GENITIVE, 'Игрец', 'Павел' ))
    eq 'Игреца Павла ',
    'Genitive case of names with fluent vowels: Pavel Igrets' );
ok( join(' ', f( GENITIVE, 'Огурец', 'Павел' ))
    eq 'Огурца Павла ',
    'Genitive case of names with fluent vowels: Pavel Ogurets' );
ok( join(' ', f( GENITIVE, 'Молодец', 'Павел' ))
    eq 'Молодца Павла ',
    'Genitive case of names with fluent vowels: Pavel Molodets' );
ok( join(' ', f( GENITIVE, 'Индеец', 'Павел' ))
    eq 'Индейца Павла ',
    'Genitive case of names with fluent vowels: Pavel Indeyets' );
ok( join(' ', f( GENITIVE, 'Индиец', 'Павел' ))
    eq 'Индийца Павла ',
    'Genitive case of names with fluent vowels: Pavel Indiyets' );
ok( join(' ', f( GENITIVE, 'Палец', 'Павел' ))
    eq 'Пальца Павла ',
    'Genitive case of names with fluent vowels: Pavel Palets' );
ok( join(' ', f( GENITIVE, 'Боец', 'Павел' ))
    eq 'Бойца Павла ',
    'Genitive case of names with fluent vowels: Pavel Boyets' );
ok( join(' ', f( GENITIVE, 'Отец', 'Павел' ))
    eq 'Отца Павла ',
    'Genitive case of names with fluent vowels: Pavel Otets' );
ok( join(' ', f( GENITIVE, 'Кац', 'Лев' ))
    eq 'Каца Льва ',
    'Genitive of given name with fluent vowel: Lev Katz' );

#ok( join(' ', f( GENITIVE, 'Эрлих', 'Вадим' ))
    #eq 'Эрлиха Вадима ',
    #'Genitive of last name ends with Kh: Vadim Erlikh' );
ok( join(' ', f( GENITIVE, 'Читая', 'Автандил' ))
    eq 'Читая Автандила ',
    'Genitive of georgian indeclinable lastname: Avtandil Chitaya' );
ok( join(' ', f( GENITIVE, 'Графин', 'Татьяна' ))
    eq 'Графин Татьяны ',
    'Genitive of feminine lastname similar to masculine possessive last name: Tatyana Grafin' );

# Too complex. Wait for next version.
# ok( join(' ', f( PREPOSITIONAL, 'Бах', 'Иоганн Себастьян' ))
#     eq 'Бахе Иоганне Себастьяне ',
#     'Prepositional case of german masculine name: Johann Sebastian Bach' );
# ok( join(' ', f( GENITIVE, 'фон Вебер', 'Карл Мария' ))
#     eq 'фон Вебера Карла Марии ',
#     'Genitive of german mixed name with prefix: Carl Maria von Weber' );
# ok( join(' ', f( DATIVE, 'Руссо', 'Жан-Жак' ))
#     eq 'Руссо Жан-Жаку ',
#     'Dative of masculine name with hyphen: Jean-Jacques Rousseau' );

# Feminine names
ok( join(' ', f( ACCUSATIVE, 'Волкова', 'Анна', 'Павловна' ))
    eq 'Волкову Анну Павловну',
    'Accusative of usual russian feminine name: Anna Pavlovna Volkova' );
ok( join(' ', f( INSTRUMENTAL, 'Соколова', 'Инна' ))
    eq 'Соколовой Инной ',
    'Instrumental case of russian feminine name without patronym: Inna Sokolova' );
ok( join(' ', f( PREPOSITIONAL,  undef, 'Маргарита', 'Пална' ))
    eq ' Маргарите Палне',
    'Prepositional case of russian feminine firstname with vulgar form of patronym: Margarita Palna' );
ok( join(' ', f( GENITIVE,  'Иванова', 'Ольга' ))
    eq 'Ивановой Ольги ',
    'Genitive of russian feminine name ends to [G Zh J K Kh Ch Sh Shch] with A: Olga Ivanova' );
ok( join(' ', f( GENITIVE,  'Петрова', 'Лена' ))
    eq 'Петровой Лены ',
    'Genitive of russian feminine name ends to [other consonant] with A: Lena Petrova' );
ok( join(' ', f( GENITIVE,  'Шевчук', 'Любовь' ))
    eq 'Шевчук Любови ',
    'Genitive of russian feminine name ends to consonants: Lyubov Shevchuk' );
ok( join(' ', f( DATIVE, 'Купер', 'Элис' ))
    eq 'Купер Элис ',
    'Dative of english feminine name ends to consonants: Alice Cooper' );
ok( join(' ', f( ACCUSATIVE, 'Петрова', 'Женя' ))
    eq 'Петрову Женю ',
    'Accusative of ambiguous name, detect by lastname: Zhenya Petrova' );
# Too complex. Wait for next version.
# ok( join(' ', f( INSTRUMENTAL, 'Фишер', 'Анна-Мария' ))
#     eq 'Фишер Анну-Марию ',
#     'Instrumental case of feminine name with hyphen: Anna-Maria Fisher' );

# Ambigous names
# How to decline?
ok( join(' ', f( PREPOSITIONAL, 'Кац', 'Саша' ))
    eq 'Кац Саше ',
    'Prepositional of ambiguous name: Sasha Katz' );
