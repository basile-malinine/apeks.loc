<?php

/**
 * DbMysql - класс доступа к базам данных MySql (в первом приближении)
 */
class DbMysql
{
    // Дескриптор PDO
    protected static $db = null;

    public function __construct($params = null)
    {
        // Защита от повторного соединения
        if ($this::$db === null) {
            if ($params === null) {
                $params = require_once 'dbconfig.php';
            }
            $this::$db = new PDO('mysql:host=' . $params['db_host'] . ';dbname=' . $params['db_name'],
                $params['db_username'], $params['db_password']);
        }
    }

    public function query($strSql, $params = [])
    {
        // Подготовка запроса
        $stmt = $this::$db->prepare($strSql);

        // Если запрос с параметрами
        $res = false;
        if (!empty($params)) {
            $res = $stmt->execute($params);
        } // без параметров
        else {
            $res = $stmt->execute();
        }

        // Возвращаем ответ
        if ($res)
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        else
            return false;
    }

    public function getRecById($table, $id)
    {
        $strSql = "SELECT * FROM $table WHERE `id` = :id";
        $params = [
            'id' => $id,
        ];
        $res = $this->query($strSql, $params);
        if ($res)
            return $res[0];
        else
            return false;
    }
}