SELECT
    O.*,
    OS.GROSS_ITEM_SALES_AMOUNT,
    OS.ITEM_DISCOUNT_AMOUNT
FROM
    {{ ref('stg_tpch_orders') }} AS O

INNER JOIN
    {{ ref('int_order_items_summary') }} AS OS 
    ON O.ORDER_KEY = OS.ORDER_KEY

ORDER BY 
    ORDER_DATE