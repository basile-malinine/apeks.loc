<?php

require_once 'database/DbMysql.php';

$db = null;

// Подключение к MySQL (параметры подключения к MySQL в файле database/dbconfig.php)
try {
    $db = new DbMysql();
} catch (Exception $exception) {
    print_r($exception->getMessage());
    die();
}

// Получить все Объекты недвижимости
$sqlObjs = <<<'OBJS'
select o.id          as Id,
       c.name        as Category,
       op.name       as Operation,
       o.address     as Address,
       o.square      as Square,
       o.floor       as Floor,
       o.price       as Price,
       o.description as Description,
       m.phone       as ContactPhone,
       m.name        as ManagerName
from categories as c,
     operations as op,
     managers as m,
     realty_objs as o
where c.id=o.category_id and op.id = o.operation_id and m.id = o.manager_id
order by o.id
;
OBJS;

// Получить все изображения Объекта по идентификатору в параметре ':objId'
$sqlImgs = <<<'IMGS'
select url as Image from images
where realty_obj_id=:objId
order by id
;
IMGS;

// Создание XMLWriter, пишем в память
$xml = new XMLWriter();
$xml->openMemory();

// Корневой элемент
$xml->startElement('Ads');
$xml->writeAttribute('formatVersion', '3');

// Получаем все записи Объектов
$objs = $db->query($sqlObjs);

// Перебор Объектов в запросе
foreach ($objs as $obj) {

    // Корневой элемент Объекта
    $xml->startElement('Ad');

    // Перебор элементов Объекта
    foreach ($obj as $key => $val) {
        // Запись в поток элемента
        $xml->writeElement($key, $val);
    }

    // Корневой элемент для изображений Объекта
    $xml->startElement('Images');      // (*)

    // Получаем изображения
    $imgs = $db->query($sqlImgs, ['objId' => $obj['Id']]);
    /**
     * Если изображения есть (необязательно)
     * Оставил для варианта, если показывать секцию Images в отсутствие картинок не нужно
     * Тогда необходимо раскомментировать первую инструкцию в условии и удалить такую же выше
     * со звёздочкой
     */
    if ($imgs) {
        // Корневой элемент для изображений Объекта
        // $xml->startElement('Images');

        // Перебор изображений
        foreach ($imgs as $img) {
            foreach ($img as $key => $val) {
                $xml->startElement($key);
                $xml->writeAttribute('url', $val);
                $xml->endElement();
            }
        }
    }
    $xml->endElement();
    $xml->endElement();
}
$xml->endElement();

// Сохраняем поток в файле
file_put_contents('test.xml', $xml->flush());
