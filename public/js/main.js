const token = '3a202d94848db5bf4d7e51ce26885ad0c9440860';

$(document).ready(() => {
    // Подключаем к полю Адрес формы реакцию на выбор подсказки
    $('#i-address').suggestions({
        token: token,
        type: 'ADDRESS',
        onSelect: parseData,
    });
});

// Ф-ция разбирает полученную подсказку и заполняет поля формы
function parseData(sgs) {
    // Получаем объект data из выбранной подсказки
    const d = sgs.data;

    // Извлекаем все необходимые поля
    let region = d.region_with_type;
    let city = d.city_with_type
    let settlement = d.settlement_with_type;
    let street = d.street_with_type;
    let house = '';
    if (d.house) house = `${d.house_type} ${d.house}`;
    let block = '';
    if (d.block) block = `${d.block_type} ${d.block}`;

    // Если Город расположен в Области, добавляем в начало Область
    let settlementFull = '';
    if (region !== city)
        settlementFull = `${region}, ${city}`;
    else
        settlementFull = city;

    // Если это Населённый пункт, добавляем
    if (settlement !== null)
        settlementFull += `, ${settlement}`;

    let houseBlock = house;

    // Если в адресе у Дома указан Корпус, добавляем
    if (d.block !== null)
        houseBlock += `, ${block}`;

    // Заполняем поля в форме
    $('#i-city').val(settlementFull);
    $('#i-street').val(street);
    $('#i-house').val(houseBlock);
}
