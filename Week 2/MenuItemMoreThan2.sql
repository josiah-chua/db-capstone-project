SELECT
    menu_name
FROM
    LittleLemonDM.MenuItems
WHERE
    menu_items_id = ANY (
        SELECT DISTINCT `menu_id`
        FROM `LittleLemonDM`.`Orders`
        WHERE `quantity` > 2
    );