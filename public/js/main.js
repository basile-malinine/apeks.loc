const token = '3a202d94848db5bf4d7e51ce26885ad0c9440860';

$(document).ready(() => {
    $('#i-address').suggestions({
        token: token,
        type: 'ADDRESS',
        onSelect: parseData,
    });
});

function parseData(sgs) {
    const d = sgs.data;
    let city = d.city_with_type
    let street = d.street_with_type;
    let house = `${d.house_type} ${d.house}`;
    let block = `${d.block_type} ${d.block}`;

    let houseBlock = house;
    if (d.block !== null)
        houseBlock += `, ${block}`;

    $('#i-city').val(city);
    $('#i-street').val(street);
    $('#i-house').val(houseBlock);
}
