--
--                 Таблица Операции
--
create table operations
(
    id   int unsigned not null auto_increment comment 'Идентификатор',
    name varchar(30)  not null comment 'Название операции',
    primary key (id)
) comment = 'Операции'
;
insert into operations (name)
values ('Аренда'),
       ('Продажа')
;


--
--                 Таблица Категории
--
create table categories
(
    id   int unsigned not null auto_increment comment 'Идентификатор',
    name varchar(30)  not null comment 'Название категории',
    primary key (id)
) comment = 'Категории'
;
insert into categories (name)
values ('Офис'),
       ('Склад'),
       ('Кафе'),
       ('Производство'),
       ('Земля')
;


--
--                 Таблица Брокеры
--
create table managers
(
    id    int unsigned not null auto_increment comment 'Идентификатор',
    name  varchar(100) not null comment 'Имя брокера',
    phone varchar(20),
    primary key (id)
) comment = 'Брокеры'
;
insert into managers (name, phone)
values ('Вишнякова Олеся Максимовна', '+7 (922) 665-02-43'),
       ('Миронова Майя Андреевна', '+7 (922) 111-11-41'),
       ('Красильников Георгий Дмитриевич', '+7 (812) 985-96-43'),
       ('Абрамов Тимофей Алексеевич', '+7 (922) 228-65-79'),
       ('Цветков Денис Романович', '+7 (495) 693-79-03')
;


--
--                 Таблица Объекты недвижимости
--
create table realty_objs
(
    id           int unsigned  not null auto_increment comment 'Идентификатор',
    operation_id int unsigned  not null comment 'Операция',
    category_id  int unsigned  not null comment 'Категория',
    manager_id   int unsigned  not null comment 'Ответственный брокер',
    address      varchar(255)  not null comment 'Адрес',
    phone        varchar(20)   not null comment 'Телефон',
    square       decimal(8, 2) not null comment 'Площадь (кв. м.)',
    price        int unsigned  not null comment 'Цена',
    floor        int           not null comment 'Этаж',
    description  text comment 'Описание',
    primary key (`id`),
    index (operation_id),
    index (category_id),
    index (manager_id),
    constraint fk_operations foreign key (operation_id) references operations (id),
    constraint fk_categories foreign key (category_id) references categories (id),
    constraint fk_managers foreign key (manager_id) references managers (id)
) comment = 'Объект недвижимости'
;
INSERT INTO realty_objs (operation_id, category_id, manager_id, address, phone, square, price, floor, description)
VALUES (FLOOR(1 + (RAND() * 2)), FLOOR(1 + (RAND() * 5)), FLOOR(1 + (RAND() * 5)),
        'Россия, г Луховицы, ул Миронова, д 12',
        '(495) 758-3049', FLOOR(200 + (RAND() * 1000)) / 10, FLOOR(20000 + (RAND() * 80001)), FLOOR(1 + (RAND() * 12)),
        'Ты, пожалуйста, их перечти, — сказал тихо Чичиков Ноздреву. — А вот же поймал, нарочно поймал! — отвечал Чичиков, продолжая писать. — Я тебя.'),
       (FLOOR(1 + (RAND() * 2)), FLOOR(1 + (RAND() * 5)), FLOOR(1 + (RAND() * 5)),
        'Россия, г Красногорск, ул Панфилова, д 46', '+7 (922) 985-4394', FLOOR(200 + (RAND() * 1000)) / 10,
        FLOOR(20000 + (RAND() * 80001)), FLOOR(1 + (RAND() * 12)),
        'Отерши пот, Чичиков решился попробовать, нельзя ли ее навести «на путь какою-нибудь иною стороною. — Вы, матушка, — отвечал зять. — А другая-то.'),
       (FLOOR(1 + (RAND() * 2)), FLOOR(1 + (RAND() * 5)), FLOOR(1 + (RAND() * 5)),
        'Россия, г Красногорск, ул Моисеева, д 21', '(35222) 31-4349', FLOOR(200 + (RAND() * 1000)) / 10,
        FLOOR(20000 + (RAND() * 80001)), FLOOR(1 + (RAND() * 12)),
        'Такой — непредвиденный случай совершенно изумил его. Слезши с козел, он стал наконец отпрашиваться домой, но таким ленивым и вялым голосом, как.'),
       (FLOOR(1 + (RAND() * 2)), FLOOR(1 + (RAND() * 5)), FLOOR(1 + (RAND() * 5)),
        'Россия, г Чехов, ул Кондратьева, д 11',
        '(495) 973-0076', FLOOR(200 + (RAND() * 1000)) / 10, FLOOR(20000 + (RAND() * 80001)),
        FLOOR(1 + (RAND() * 12)),
        'Было заметно, что при этом «было очень умилительно глядеть, как сердца граждан трепетали в избытке благодарности и струили потоки слез в знак.'),
       (FLOOR(1 + (RAND() * 2)), FLOOR(1 + (RAND() * 5)), FLOOR(1 + (RAND() * 5)),
        'Россия, г Егорьевск, ул Андреева, д 90',
        '(35222) 46-0509', FLOOR(200 + (RAND() * 1000)) / 10, FLOOR(20000 + (RAND() * 80001)),
        FLOOR(1 + (RAND() * 12)),
        'Собакевич показал на кресла, сказавши опять: «Прошу!» Садясь, Чичиков взглянул на него искоса, когда проходили они столовую: медведь! совершенный.'),
       (FLOOR(1 + (RAND() * 2)), FLOOR(1 + (RAND() * 5)), FLOOR(1 + (RAND() * 5)),
        'Россия, г Шаховская, ул Тихонова, д 57',
        '8-800-310-8474', FLOOR(200 + (RAND() * 1000)) / 10, FLOOR(20000 + (RAND() * 80001)),
        FLOOR(1 + (RAND() * 12)),
        'Дай бог, чтобы прошло. Я-то смазывала свиным салом и скипидаром тоже — предполагал, большая смертность; совсем неизвестно, сколько умирало, их никто.'),
       (FLOOR(1 + (RAND() * 2)), FLOOR(1 + (RAND() * 5)), FLOOR(1 + (RAND() * 5)),
        'Россия, г Мытищи, ул Казакова, д 90',
        '8-800-794-4126', FLOOR(200 + (RAND() * 1000)) / 10, FLOOR(20000 + (RAND() * 80001)),
        FLOOR(1 + (RAND() * 12)),
        'Прощайте, мои крошки. Вы — давайте настоящую цену! «Ну, уж черт его знает. Кончил он наконец следующие — слова: — Если бы ты казну! Нет, кто уж.'),
       (FLOOR(1 + (RAND() * 2)), FLOOR(1 + (RAND() * 5)), FLOOR(1 + (RAND() * 5)),
        'Россия, г Можайск, ул Уварова, д 34',
        '8-800-556-1351', FLOOR(200 + (RAND() * 1000)) / 10, FLOOR(20000 + (RAND() * 80001)),
        FLOOR(1 + (RAND() * 12)),
        'Но здоровые и полные щеки его так скоро купить? — Как на что? да ведь я с тобою нет возможности играть. — Отчего ж не отойдешь, почувствуешь скуку.'),
       (FLOOR(1 + (RAND() * 2)), FLOOR(1 + (RAND() * 5)), FLOOR(1 + (RAND() * 5)),
        'Россия, г Москва, ул Морозова, д 92',
        '(495) 821-1655', FLOOR(200 + (RAND() * 1000)) / 10, FLOOR(20000 + (RAND() * 80001)),
        FLOOR(1 + (RAND() * 12)),
        'Порфирий, Павлушка! — кричал Ноздрев, — подступая еще ближе. — Капитан-исправник. — А женского пола не хотите? — Нет, брат, сам ты врешь! — сказал.'),
       (FLOOR(1 + (RAND() * 2)), FLOOR(1 + (RAND() * 5)), FLOOR(1 + (RAND() * 5)),
        'Россия, г Ногинск, ул Денисова, д 40',
        '(495) 876-7010', FLOOR(200 + (RAND() * 1000)) / 10, FLOOR(20000 + (RAND() * 80001)),
        FLOOR(1 + (RAND() * 12)),
        'Гости слышали, как он заказывал повару обед; сообразив это, Чичиков, начинавший уже несколько чувствовать аппетит, увидел, что Собакевич не любил.'),
       (FLOOR(1 + (RAND() * 2)), FLOOR(1 + (RAND() * 5)), FLOOR(1 + (RAND() * 5)),
        'Россия, г Клин, ул Назарова, д 63',
        '(812) 944-98-95', FLOOR(200 + (RAND() * 1000)) / 10, FLOOR(20000 + (RAND() * 80001)),
        FLOOR(1 + (RAND() * 12)),
        'Нет, я вижу, вы не хотите закусить? — сказала хозяйка, — да вот беда: — урожай плох, мука уж такая неважная… Да что же твой приятель не едет?».'),
       (FLOOR(1 + (RAND() * 2)), FLOOR(1 + (RAND() * 5)), FLOOR(1 + (RAND() * 5)),
        'Россия, г Красногорск, ул Яковлева, д 89', '+7 (922) 747-5271', FLOOR(200 + (RAND() * 1000)) / 10,
        FLOOR(20000 + (RAND() * 80001)), FLOOR(1 + (RAND() * 12)),
        'Чичиков, — и боже! чего бы не два мужика. попавшиеся навстречу, то вряд ли где можно найти отвечающую ногу, особливо в нынешнее время, когда и на.'),
       (FLOOR(1 + (RAND() * 2)), FLOOR(1 + (RAND() * 5)), FLOOR(1 + (RAND() * 5)),
        'Россия, г Серпухов, ул Никифорова, д 3',
        '(495) 257-3720', FLOOR(200 + (RAND() * 1000)) / 10, FLOOR(20000 + (RAND() * 80001)),
        FLOOR(1 + (RAND() * 12)),
        'Ноздрев, — подступая еще ближе. — Не сорвал потому, что загнул утку не вовремя. А ты думаешь, доедет то колесо, если б тебя отодрали «наяву».'),
       (FLOOR(1 + (RAND() * 2)), FLOOR(1 + (RAND() * 5)), FLOOR(1 + (RAND() * 5)),
        'Россия, г Раменское, ул Миронова, д 37',
        '(812) 232-40-63', FLOOR(200 + (RAND() * 1000)) / 10, FLOOR(20000 + (RAND() * 80001)),
        FLOOR(1 + (RAND() * 12)),
        'Чичиков, — и явился где-нибудь в конце города дом, купленный на имя жены, потом в другую, потом, изменив и образ нападения и сделавшись совершенно.'),
       (FLOOR(1 + (RAND() * 2)), FLOOR(1 + (RAND() * 5)), FLOOR(1 + (RAND() * 5)),
        'Россия, г Щёлково, ул Денисова, д 9',
        '(35222) 66-4807', FLOOR(200 + (RAND() * 1000)) / 10, FLOOR(20000 + (RAND() * 80001)),
        FLOOR(1 + (RAND() * 12)),
        'Положим, например, существует канцелярия, не здесь, а в обращенных к нему ближе. — Капитан-исправник. — А еще какой? — Москва, — отвечал Собакевич.')
;


--
--                 Таблица Изображения
--
create table images
(
    id            int unsigned not null auto_increment comment 'Идентификатор',
    realty_obj_id int unsigned not null comment 'Объект недвижимости',
    url           varchar(255) not null comment 'Ссылка на изображение',
    primary key (id),
    index (realty_obj_id),
    constraint fk_realty_objs foreign key (realty_obj_id) references realty_objs (id)
) comment = 'Изображения'
;
insert into images (realty_obj_id, url)
values (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/01.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/02.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/03.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/04.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/05.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/06.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/07.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/08.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/09.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/10.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/11.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/12.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/13.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/14.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/15.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/16.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/17.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/18.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/19.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/20.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/21.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/22.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/23.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/24.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/25.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/26.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/27.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/28.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/29.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/30.jpeg'),
       (FLOOR(1 + (RAND() * 15)), 'https://www.testsite.ru/img/31.jpeg')
;
