SELECT
    CD.customer_id,
    CD.customer_names,
    O.order_id,
    O.total_cost,
    MI.courses,
    MI.starters
FROM
    LittleLemonDM.Customer_Details AS CD
JOIN
    LittleLemonDM.Orders AS O ON CD.customer_id = O.customer_id
JOIN
    LittleLemonDM.MenuItems AS MI ON O.menu_id = MI.menu_items_id
WHERE
    O.total_cost > 90
ORDER BY
    O.total_cost;